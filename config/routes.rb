Rails.application.routes.draw do
  resources :articles
  resources :cars
  root 'pages#home'
  get   'about', to: 'pages#about'
end
