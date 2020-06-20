Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#main'
  get '/irc', to: 'pages#irc'
  get '/group', to: 'pages#group'
  get '/events', to: 'pages#events'
  get '/code-of-conduct', to: 'pages#code_of_conduct'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks',
                                    registrations:      'users/registrations',
                                    sessions:           'users/sessions' }
  resources :users, only: [:index, :new, :create, :edit]
  resources :companies, only: [:index, :new, :create]
end
