class Item < ApplicationRecord
  has_one_attached :image

  
  
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
  
  
 extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to :prefecture
  belongs_to :category
  belongs_to :shipping_fee
  belongs_to :condition
  belongs_to :shipping_date

  end
  
end

