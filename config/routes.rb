Rails.application.routes.draw do
  devise_for :users
  root "cocktails#index"
  mount Attachinary::Engine => "/attachinary"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:index, :new, :create, :destroy]
  end

  # resources :ingredients, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
