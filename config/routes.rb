Rails.application.routes.draw do
  resources :users
  root 'sessions#new'
  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#logout'
end
