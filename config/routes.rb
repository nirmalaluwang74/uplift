Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :favours, only: [:index, :show, :create, :new] do
    resources :applications, only: [:create, :edit, :update], shallow: true do
      resources :reviews, only: [:new, :create, :index]
      member do
      get 'mark_as_done'
      end
    end
  end
  resources :applications, only: [:index]
  resources :credits, only: [:index, :show]
  get '/done_applications', to: 'applications#index_done_applications'
  
end
