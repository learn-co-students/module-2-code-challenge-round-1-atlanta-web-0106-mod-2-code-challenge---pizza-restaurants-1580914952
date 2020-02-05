Rails.application.routes.draw do
  # get '/restaurants', to: 'restaurants#index'
  resources :restaurants, only: [:index, :show]
  resources :pizzas, only: [:index, :show, :new, :create]
  # get '/pizzas', to: 'pizzas#index'
end
