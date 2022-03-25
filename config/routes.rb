Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  root "users#top"
  get "/sign_in_form" => "users#sign_in_form"
  post "/sign_in" => "users#sign_in"
  post "/log_out" => "users#log_out"
end
