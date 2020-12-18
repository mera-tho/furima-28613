class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name ,null: false
      t.integer :price ,null: false
      t.text :explanation ,null: false
      t.integer :condition_id ,null: false
      t.integer :shipping_fee_id ,null: false
      t.integer :shipping_date_id ,null: false
      t.integer :prefecture_id ,null: false
      t.timestamps
    end
  end
end
