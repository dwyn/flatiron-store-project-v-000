class LineItemsController < ApplicationController
  def create
    if current_user.current_cart.nil? || current_user.current_cart.status == "submitted"
      @cart = Cart.create(user_id: current_user.id)
      current_user.update(current_cart: @cart)
    else
      @cart = current_cart
    end
    line_item = @cart.add_item(params[:item_id])
    if line_item.save
      @cart.save
      redirect_to cart_path(@cart)
    else
      redirect_to root_path
    end
  end
end
