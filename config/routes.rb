Rails.application.routes.draw do
  resources :twitts, only: %i[index new edit create update destroy]

  root 'twitts#index'
end
