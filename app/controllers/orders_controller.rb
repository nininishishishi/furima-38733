class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:create]
  before_action :move_to_index2, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.price = @item.price
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :municipalities, :address, :building, :telephone_number).merge(user_id: current_user.id,item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

    def move_to_index
      @item = Item.find(params[:item_id])
      return unless user_signed_in? && current_user.id == @item.user_id
     # if @item.order.present? || current_user == @item.user 
        redirect_to root_path and return
    end

    def move_to_index2
      @item = Item.find(params[:item_id])
      if @item.order.present? || current_user == @item.user
        redirect_to root_path
      end
    end
end
