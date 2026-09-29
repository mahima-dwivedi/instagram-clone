Rails.application.routes.draw do
  get 'search' => 'search/index'
  root 'home#index'

  # Devise routes hamesha upar hone chahiye
  devise_for :users

  # Custom Users routes
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy]
end