Rails.application.routes.draw do
  # get 'addresses/index'
  resources :addresses
  root 'addresses#index'
end
