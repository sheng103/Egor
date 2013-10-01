class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :service
      t.integer :line_item_id
      t.string :body
      t.timestamps
    end
  end
end
