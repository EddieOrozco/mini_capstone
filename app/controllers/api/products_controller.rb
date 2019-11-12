class Api::ProductsController < ApplicationController
  def index
    @products = Product.all.order(:id)
    render "index.json.jb"
  end

  def first_products_method
    @products = Product.first
    render "first_product.json.jb"
  end

  def create
    @products = Product.new(
      # id: params[:id],
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    @products.save
    render "show.json.jb"
  end

  def show
    @products = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @products = Product.find_by(id: params[:id])
    @products.id = params[:id] || @products.id
    @products.name = params[:name] || @products.name
    @products.price = params[:price] || @products.price
    @products.image_url = params[:image_url] || @products.image_url
    @products.description = params[:description] || @products.description
    @products.save
    render "show.json.jb"
  end

  def destroy
    @products = Product.find_by(id: params[:id])
    @products.destroy
    render json: { message: "Destroy" }
  end
end
