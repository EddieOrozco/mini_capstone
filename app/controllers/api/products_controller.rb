class Api::ProductsController < ApplicationController
  def products_method
    @products = Product.first
    render "products.json.jb"
  end
end
