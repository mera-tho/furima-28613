class ItemsController < ApplicationController
  
  def index  
    @items = Item.all
  end
  
  def new
    @items = Item.new
  end
  
  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :prefecture_id, :category_id, :category_id, :shipping_fee,:shipping_date,)
  end

end