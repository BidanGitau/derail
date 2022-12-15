Rails.application.routes.draw do
  resources :cars
  root 'pages#home '
  get   'about', to: 'pages#about'
end
