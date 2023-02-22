Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  ### User Routes
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  ### Post Routes
  get "/posts" => "posts#index"
  get "/posts/:id" => "posts#show"
  post "/posts/" => "posts#create"
  patch "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"
end
