Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :users, only: [:new, :index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]

  get 'home/about' => 'homes#about', as:'about'

end

