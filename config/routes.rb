Rails.application.routes.draw do

  resources :posts
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

   post 'post_likes', to: 'posts#post_likes'

   post 'post_comments', to: 'posts#post_comments'

   get 'user_post', to: 'posts#user_posts'

  #resources :users

end
