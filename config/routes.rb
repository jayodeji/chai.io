ChaiIo::Application.routes.draw do

  # devise_for :users, controllers: {sessions: "sessions"}, :skip => [:registrations]
  devise_for :users, controllers: {sessions: "sessions", registrations: "users"}

  # TODO make home redirect to listing of projects instead of login page
  devise_scope :user do
    #sign in and out temporarily
    root :to => 'sessions#new'
    get '/' => 'sessions#new'
    get '/sessions/user' => 'sessions#new'
    post '/sessions/user' => 'sessions#create'
    delete '/sessions/user' => 'sessions#destroy'

    get '/users/edit' => 'users#edit', :as => 'edit_user_registration'
    put '/users/edit' => 'users#update', :as => 'user_registration'
  end

  # root :to => 'home#index'
  # get '/' => 'home#index'
  # root :to => 'sessions#new'
  # get '/' => 'sessions#new'

  namespace :admin do
    get '/' => 'admin#index'
    resources :users do
      put 'lock'
      put 'unlock'
    end
  end

  resources :sessions

  get '/logout' => 'sessions#destroy'
  get '/r/:id/:hash' => 'reports#public'

  get '/console' => 'console#index'
  post '/console/run' => 'console#run'

  get '/reports/search' => 'reports#search'
  get '/reports/starred' => 'reports#starred'
  get '/reports/shared' => 'reports#shared'
  get '/reports/tags/:tag' => 'reports#tagged_with'
  resources :reports do
    get 'share'
    get 'unshare'
    get 'star'
  end

  match '/datasources/test' => 'datasources#test', :via => :post
  resources :datasources

  # resources :users
  resources :projects

  resources :projects do
    resources :reports do
      get 'share'
      get 'unshare'
    end
    resources :dashboards
  end


end
