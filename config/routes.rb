Rails.application.routes.draw do
  resources :bookmarks
  resources :types
  resources :categories
  get 'categories/jsoncat/:id', to: 'categories#jsoncat'
  root 'categories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
