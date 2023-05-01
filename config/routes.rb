# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    resources :comments
  end
end
