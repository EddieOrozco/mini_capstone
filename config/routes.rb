Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    # get "/first_products_url" => "products#first_products_method"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end
end
