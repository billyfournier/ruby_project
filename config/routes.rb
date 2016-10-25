Rails.application.routes.draw do
  root 'sessions#new'
  get '/sessions/new' => 'sessions#new'
  post '/users' => 'users#create'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  get '/groups' => 'groups#index'
  post '/groups' => 'groups#create'

  get 'groups/:id' => 'groups#show'
  delete '/groups/:id' => 'groups#destroy'

  post '/members/:id' => 'members#create'
  delete '/members/:id' => 'members#destroy'
end
