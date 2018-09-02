Rails.application.routes.draw do
  resources :projects

  root to: "pages#landing"
  get "/about" => "pages#about"
  get "/contact" => "pages#contact"

  get "/dashboard" => "admin#dashboard"
  get "/login" => "admin#new"
  post "/login" => "admin#create"
  delete "/logout" => "admin#destroy"
end
