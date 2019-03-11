# Rails.application.routes.draw do
#
#   get 'questions/index'
#
#
#
#   root to: 'questions#index'
#
#   resources :questions  do
#     resources :answers
#   end
#
#   devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end


 Rails.application.routes.draw do
  resources :questions, :has_many => :answers
  root to: 'questions#index'
  resources :questions  do
      resources :answers
    end
  devise_for :users
end
