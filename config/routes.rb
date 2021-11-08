Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get "hello", to: "hello#index"

  get "articles", to: "articles#new"

  post "articles", to: "articles#create"

  get "articles/:id", to: "articles#show"

  get "articles/:id/edit", to: "articles#edit"

  patch "articles/:id", to: "articles#update", as: :article

  delete "articles/:id", to: "articles#destroy"

end
