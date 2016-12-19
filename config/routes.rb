Rails.application.routes.draw do
  root to: 'users#main'

  get '/main' => 'users#main'

  get '/groups' => 'groups#index'

  get '/groups/:id' => 'groups#show'

  post '/create' => 'users#create'

  post '/login' => 'sessions#create'

  post '/new' => 'groups#create'

  post 'members/:id' => 'members#add'

  delete '/logout' => 'sessions#destroy'

  delete '/members/:id/' => 'members#destroy'

  delete '/groups/:id' => 'groups#destroy'
end
