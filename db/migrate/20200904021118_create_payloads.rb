class CreatePayloads < ActiveRecord::Migration[5.2]
  def change
    create_table :payloads do |t|
      t.integer :store_id
      t.datetime :date_created
      t.datetime :date_closed
      t.datetime :last_updated
      t.float :total_amount
      t.float :total_shipping
      t.float :total_amount_with_shipping
      t.float :paid_amount
      t.datetime :expiration_date
      t.float :total_shipping
      t.jsonb :order_items, array: true, default: []
      t.jsonb :payments, array: true, default: []
      t.jsonb :shipping, default: '{}'
      t.string :status
      t.jsonb :buyer, default: '{}'

      t.timestamps
    end
  end
end
