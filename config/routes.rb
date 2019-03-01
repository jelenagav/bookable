Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :books, except: [:create]
  end
  resources :books, only: [:index, :show, :create] # /books
  resources :bookings


end
