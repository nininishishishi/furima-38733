class ItemsController < ApplicationController


  def index
    #@items = Item.all
    # @articles = Article.order("created_at DESC")
  end

  def new
    authenticate_user!
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :detail, :category_id, :condtion_id, :shipping_cost_id, :prefecture_id,
                                 :reserve_id, :price).merge(user_id: current_user.id)
  end
end
