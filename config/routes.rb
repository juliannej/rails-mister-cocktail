Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:index, :new, :create, :destroy]
  end

  # resources :ingredients, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
