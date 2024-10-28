class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
   

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit  
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def update
    # 商品情報を更新し、成功した場合と失敗した場合の処理
    if @item.update(item_params)
    # 更新に成功した場合は、商品詳細ページにリダイレクトし、通知を表示
      redirect_to item_path(@item)
    else
    # 更新に失敗した場合は、再度編集ページを表示
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if @item.order.present? && @item.user != current_user
  end

end
