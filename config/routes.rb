Rails.application.routes.draw do

  root 'welcome#home'
  resources :users, only: [:new, :index, :create, :show]
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :attractions
  post "/rides/new", to: "rides#new"
end