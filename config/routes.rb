Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :posts, only: [:new, :create, :index] do
    resources :likes, only: [:create, :destroy]
  end
end
