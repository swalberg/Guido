class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :client_id
      t.string :method
      t.text :disposition

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
