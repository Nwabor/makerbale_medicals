Rails.application.routes.draw do
  # get 'doctors/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  authenticated :user do

  end

  unauthenticated do
    root to: 'devise/registrations#new', as: :unauthenticated_root
  end

  resource :doctor
  resource :receptionist
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
end
