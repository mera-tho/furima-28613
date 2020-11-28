class ItemsController < ApplicationController
  def index  # indexアクションを定義した
    @items = Items.all
  end
end
