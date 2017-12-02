Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    collection do 
      put :change_current_city
    end
  end

  resources :categories, only: [:index, :show]

  resources :messages, only: [:index]

  get '/home/user', to: 'home#user', as: 'user_home'

  root to: 'categories#index'

  mount ActionCable.server => '/cable' 
end
