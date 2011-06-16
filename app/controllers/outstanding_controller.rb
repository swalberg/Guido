class OutstandingController < ApplicationController

  def index
    # Grab the list of overdue invoices
    outstanding = FreshBooks::Invoice.list("status" => "unpaid")
    # Collate and bucket into ages
    @clients = outstanding.inject({}) do |clients, invoice|
      unless clients.has_key? invoice.client_id
        clients[invoice.client_id] = {
          :details => { :org  => invoice.organization, :name => "#{invoice.first_name} #{invoice.last_name}" },
          :thirty => 0, :sixty => 0, :other => 0,
          :invoices => Array.new
        }
      end
      age = Date.today - invoice.date
      if age <= 30 then
        clients[invoice.client_id][:thirty] += invoice.amount
      elsif  age <= 60
        clients[invoice.client_id][:sixty] += invoice.amount
      else
        clients[invoice.client_id][:other] += invoice.amount:w
      end
      clients[invoice.client_id][:invoices] << invoice

      clients
    end

    # get the appropriate amount of history and add to the struct
    @clients.each do |id, client|
      @clients[id][:object] = Client.history(id, client[:other] > 0 ? 365:60)
    end
  end


  def resend
    if invoice = FreshBooks::Invoice.get(params[:id])
      invoice.send_by_email
      render(:text => "OK")
    else
      render(:text => "ERROR")
    end
  end

end
