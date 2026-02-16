Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path
  root "gossips#index"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Routes for testing
  get "users/show"
  get "gossips/index"
  get "gossips/show"
  get "static_pages/team"
  get "static_pages/contact"

  # Dynamic welcome route
  get "/welcome/:first_name", to: "static_pages#welcome"

  # RESTful resources
  resources :gossips
  resources :users, only: [ :show ]
end
