class Api::ProductsController < ApplicationController
  def index
    @products = Product.all.order(:id)
    render "index.json.jb"
  end

  # def first_products_method
  #   @product = Product.first
  #   render "first_product.json.jb"
  # end

  def create
    @product = Product.new(
      # id: params[:id],
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    @product.save
    render "show.json.jb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.id = params[:id] || @product.id
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.save
    render "show.json.jb"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "Destroy" }
  end
end
