Rails.application.routes.draw do
  resources :articles
  resources :comments
  resource  :account,   only: [:show] do
    get :work
  end

  namespace :api do
    namespace :v1 do
      resources :articles
      resources :comments
    end
  end

  get  '/login'     => 'sessions#new'
  post '/login'     => 'sessions#create'
  get  '/logout'    => 'sessions#destroy'

  get  '/dashboard' => 'dashboard#show'

  root to: 'articles#index'
end
