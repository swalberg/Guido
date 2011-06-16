class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.integer :freshbooks_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
