Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    get "/first_products_url" => "products#first_products_method"
    get "/product_params_url/:id" => "products#product_params_method"
  end
end
