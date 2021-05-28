Rails.application.routes.draw do
  get "/index" => "recipes#index"
  post "/index" => "recipes#show" # More appropriate for the input this site expects
end
