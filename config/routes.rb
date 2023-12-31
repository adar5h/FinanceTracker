Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  get 'search_friends', to: 'users#search'
  get 'friends', to: 'users#friends' 
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]
  get '/dev', to: redirect('https://www.github.com/adar5h')
  get 'send_email', to: 'application#send_email', as: :send_email
end
