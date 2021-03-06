Rails.application.routes.draw do
  post "register", to: "registrations#create", as: "register"
  match '/register', to: 'registrations#new', via: [:get]

  post "login", to: "sessions#create", as: "login"
  match '/login', to: 'sessions#new', via: [:get]

  get "/logout", to: "sessions#destroy", as: "logout"
  get "/calendar/:token", to: "calendar#index", as: "calendar"

  get '/auth/:provider/callback', to: 'external_authentications#create'

  resources :bills

  root to: "home#index"
end
