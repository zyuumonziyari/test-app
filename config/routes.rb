Rails.application.routes.draw do
  devise_for :users
  resources :tests
  root 'posts#index'
  resources :posts, only: [:new, :create, :show, :destroy] # 追加

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
