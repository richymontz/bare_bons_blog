Rails.application.routes.draw do
  root 'landing#index'

  resources :admin, only: [:index]
  resources :posts  
  resources :comments, only: [:create]
end
