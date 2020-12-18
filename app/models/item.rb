class Item < ApplicationRecord
  with_options presence: true do
    validates :name 
    validates :price
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :image
    

  end
