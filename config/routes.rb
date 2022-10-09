Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :show]
  resources :users, only: [:new, :create, :show]
end
