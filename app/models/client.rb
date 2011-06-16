class Client < ActiveRecord::Base
  has_many :contacts

  def self.history(id, length=60)

    history = Client.where(:freshbooks_id => id).includes(:contacts)
    if history.empty?
      Client.create(:freshbooks_id => id)
    else
      history.first
    end
  end
end
