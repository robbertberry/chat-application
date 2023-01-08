# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'rooms/index'
  root 'pages#home'
  resources :rooms do
    resources :messages
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
