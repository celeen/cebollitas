Rails.application.routes.draw do

  # mount_push_type

  # get 'welcome/index'

  root 'welcome#index'
  get 'donate', to: 'pages#donate', as: 'donate'
  get 'terms', to: 'pages#terms', as: 'terms'
  get 'privacy_policy', to: 'pages#privacy_policy', as: 'privacy_policy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
