class ContactsController < ApplicationController
  def index
  end

  def create
    @client = Client.find(params[:client_id])
    @contact = @client.contacts.build(params[:contact])
    if @contact.save
      flash[:notice] = "Saved"
    else
      flash[:error] = @contact.errors.full_messages.to_sentence
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
