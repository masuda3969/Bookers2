Rails.application.routes.draw do

  devise_for :users
  root to: 'home#top'
  get 'home/about', as:"about"
 
  # get '/books', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :books
  resources :users, only: [:index, :new, :show, :create, :edit, :update]
  post '/users/:id', to: 'books#create'
  

end
