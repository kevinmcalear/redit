Redit::Application.routes.draw do
  post "/session", to: "session#create"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"
  root "welcome#index"


end
