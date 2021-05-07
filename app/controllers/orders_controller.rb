class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
    @order_address=OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address=OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, 
                   :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

end