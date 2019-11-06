class Api::ProductsController < ApplicationController
  def products_method
    @products = Product.all
    render "products.json.jb"
  end
end
