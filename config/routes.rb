Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tickets
  resources :tickets do
    resources :bookings, only: [:index, :show, :new, :create, :destroy]
  end

  resources :bookings
  resources :parties

end
