class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path if (current_user.id != @item.user_id) || !@item.order.nil?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      @item
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_text, :item_image, :category_id, :status_id, :delivery_fee_id, :prefecture_id,
                                 :shipment_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
