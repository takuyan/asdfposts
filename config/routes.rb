Rails.application.routes.draw do
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      resources :posts, only: %i(index create show update destroy)
    end
  end

  devise_for :users
  root to: 'home#index'
  resources :posts
end
