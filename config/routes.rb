Rails.application.routes.draw do
  root to: "homes#show"
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  #get 'sessions/new'
  #get 'users/new'

 #using generator for clearance routes
 #root 'static_pages#home'
 #get '/help', to: 'static_pages#help'
 #get '/about', to: 'static_pages#about'
 #get '/contact', to: 'static_pages#contact'
 #get '/signups', to: 'users#new'
 #get '/login', to: 'sessions#new'
 #post '/login', to: 'sessions#create'
 #delete '/logout', to: 'sessions#destroy'
 #resources :users
end

