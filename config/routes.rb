Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'

  devise_for :users
  root to: 'homes#top'
  get 'homes/about'

  resources :posts
  resources :users,only: [:show, :edit, :index, :update]

# 追加　名前つきルーティング

# mypage
  get "mypage"=>"users#mypage"

# 退会確認
  get 'users/:id/quit' => 'users#quit', as: 'quit'

# 退会処理用
  patch 'users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
