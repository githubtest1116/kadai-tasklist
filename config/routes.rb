Rails.application.routes.draw do

  root 'toppages#index'
  #root to: 'tasks#index'

  get 'signup' => 'users#new'

  resources :tasks
  resources :users
  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
