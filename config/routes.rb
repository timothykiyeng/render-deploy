Rails.application.routes.draw do
  resources :comments
  resources :skill_sets, only: [:index, :show, :update]

  post "/signup", to: "users#create"
  get "/me", to: "users#show"

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

end
