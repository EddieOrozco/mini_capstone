class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "idex.json.jb"
  end

  def create
    product = Product.find_by(id: params[:product_id])
    price = product.price
    calculated_subtotal = params[:quantity].to_i * price
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: prams[:subtotal],
      tax: prams[:tax],
      quantity: [:quantity],
    )
    if @order.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: 422
    end
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render "show.json.jb"
  end
end
