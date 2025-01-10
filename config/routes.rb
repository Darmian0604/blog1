Rails.application.routes.draw do
  get "users/new"
  get "users/create"
  resources :users, only: [:new, :create]
  root "products#index"
  resource :session
  resources :passwords, param: :token
  resources :products do
    resources :subscribers, only: [ :create ]
    resource :unsubscribe, only: [ :show ]
  end
end
