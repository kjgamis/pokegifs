Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pokemon#index'
  get '/', to: 'pokemon#index', as: 'root_path'

  resources :pokemon, only: [:index, :show]
end
