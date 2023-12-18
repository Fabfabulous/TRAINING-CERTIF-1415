Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.


  # Defines the root path route ("/")
  root "vehicles#index"
  resources :vehicles do
    resources :bookings, only: %i[new create]
  end

  resources :booking, only: %i[edit update show destroy]
end
