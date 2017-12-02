Rails.application.routes.draw do

  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  delete 'tasks/:id', to: 'tasks#destroy', as: 'tasks_del'

  resources :tasks
  resources :users
  resources :sessions, only: [:edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
