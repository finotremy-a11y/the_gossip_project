Rails.application.routes.draw do
  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :show]
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :tags, only: [:show]
  resources :private_messages, only: [:new, :create, :show]

  root "gossips#index"

  get "static_pages/team"
  get "static_pages/contact"
end
