Rails.application.routes.draw do

  # mount_push_type

  # get 'welcome/index'

  root 'welcome#index'
  get 'donate', to: 'welcome#donate', as: 'donate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
