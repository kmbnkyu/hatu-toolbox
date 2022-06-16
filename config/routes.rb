Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get 'search', to: 'searches#search'
  resources :users, only: [:show, :create, :edit, :update, :destroy]
  
  resources :memos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
