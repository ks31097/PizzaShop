class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.text :name
      t.text :phone
      t.text :delivery_address
      t.text :client_order

      t.timestamps
    end
  end
end
