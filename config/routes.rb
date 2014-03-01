Redit::Application.routes.draw do
  
  resources :users

  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"
  root "welcome#index"


end
