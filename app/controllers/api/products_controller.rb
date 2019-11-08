class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def first_products_method
    @products = Product.first
    render "first_product.json.jb"
  end

  def product_params_method
    @products = Product.first
    render "product_params.json.jb"
  end
end
