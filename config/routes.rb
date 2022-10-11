Rails.application.routes.draw do
  root 'users#new'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :sessions
  resources :users
end
