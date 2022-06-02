Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :users, only: [:new, :index, :show, :edit, :update] do
   resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'

  end
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
  resources :book_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]

   end

  get 'home/about' => 'homes#about', as:'about'
  get '/search', to: 'searches#search'

  end

