Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'user/signup', to: 'user_sessions#signup'
  post 'user/login', to: 'user_sessions#login'
  get 'user/validate_authenticity', to: 'external_apis#validate_authenticity'
end
