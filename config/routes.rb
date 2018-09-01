Rails.application.routes.draw do
  resources :projects

  root to: 'pages#landing'
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
end
