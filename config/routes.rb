Rails.application.routes.draw do
  root to: 'see_and_says#index'
  resources :see_and_says
end
