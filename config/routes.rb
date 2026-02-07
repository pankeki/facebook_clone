Rails.application.routes.draw do
  get "comments/create"
  devise_for :users
  root "home#index"

  resources :posts, only: [ :new, :create, :index ] do
    resources :likes, only: [ :create, :destroy ]
    resources :comments, only: [ :create ]
  end

  resource :user, only: [ :edit, :update ]  # <- move this here
end
