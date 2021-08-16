Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'reservations/new'
  post 'reservations/show'
  post 'reservations/complete'
  resources :users
  resources :rooms
  resources :reservations
end
