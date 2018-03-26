Rails.application.routes.draw do
  root 'homepage#index'

  # Add routes below this line
  resources :users, only: [:create]

  get    'tasks/:id'                => 'tasks#show'
  get    'tasks'                    => 'tasks#index'
  post   'tasks'                    => 'tasks#create'
  put    'tasks/:id'                => 'tasks#update'
  put    '/tasks/:id/mark_complete' => 'tasks#mark_complete'
  put    '/tasks/:id/mark_active'   => 'tasks#mark_active'
  delete 'tasks/:id'                => 'tasks#destroy'

  # Add routes below above line
  get 'demo'    => 'demo#index'

  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path'    => 'homepage#index'
end
