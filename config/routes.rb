Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'rooms/:id', to: 'rooms#show', as: 'room'
  resources :users
  resources :rooms
  resources :reservations
end
