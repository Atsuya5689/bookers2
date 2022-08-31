Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'homes#top'

  resources :books, only: [:new, :index, :show, :edit, :update, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]

  get '/home/about' => "homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
