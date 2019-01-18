# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations',
                                    confirmations: 'users/confirmations' }
  devise_for :admins, controllers: { sessions: 'admins/sessions',
                                     registrations: 'admins/registrations',
                                     confirmations: 'admins/confirmations' }

  root to: "home#landing_page"

  get '/home', to: 'home#landing_page'

  namespace 'administration' do
    get '/', to: 'items#index'

    resources :items
  end
end
