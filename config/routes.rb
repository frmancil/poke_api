Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/pokemons', to: 'pokemons#index'
  get '/pokemons/show', to: 'pokemons#show'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :pokemons do
    resources :abilities
    resources :types
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
