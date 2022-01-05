Rails.application.routes.draw do
  resources :posts
  root'posts#index'
  get '/post/hashtag/:name' => 'posts#hashtag'
  get '/post/hashtag' => 'posts#hashtag'
end