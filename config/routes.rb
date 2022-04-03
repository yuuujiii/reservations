Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "users/update_profile" => "users#update_profile"
  post "users/update_acount" => "users#update_acount"
  get "users/acount" => "users#acount"
  get "users/profile" => "users#profile"
  get "rooms/search" => "rooms#search"
  resources :reservation
  resources :rooms
  resources :users
  root "users#top"
  get "/sign_in_form" => "users#sign_in_form"
  post "/sign_in" => "users#sign_in"
  post "/log_out" => "users#log_out"
end
