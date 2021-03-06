Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about', to: 'homes#about'
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers
    end
  end
  get 'chat/:id', to: 'chat#show', as: 'chat'
  post 'chats', to: 'chat#create'
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get '/search', to: 'search#search'
end
