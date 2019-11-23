class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    pp current_user
    @products = Product.all
    if params[:search]
      @products = @products.where("name ILIKE ?", "%#{params[:search]}%")
    end
    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
    @products = @products.order(:id => :asc)
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
      # image_url: params[:image_url],
      description: params[:description],
    )
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
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
    # @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.save
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: { message: "Destroy" }
  end
end
