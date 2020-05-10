Rails.application.routes.draw do
	root 'home#top'
	get 'home/about', to: 'home#about'
	get '/users', to: 'users#index'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users
  # For details on the DSL  within this file, see http://guides.rubyonrails.org/routing.html
end
