Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'

  devise_for :users
  root to: 'homes#top'
  get 'homes/about'

  resources :posts
  resources :users,only: [:show, :edit, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
