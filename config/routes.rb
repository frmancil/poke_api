Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/', to: 'pokemons#index'
  get '/abilities', to: 'abilities#index'
  get '/types', to: 'types#index'
  get '/about', to: 'about#show'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :pokemons
  resources :abilities
  resources :types

  # Defines the root path route ("/")
  # root "posts#index"
end
