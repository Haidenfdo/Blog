Rails.application.routes.draw do
  get 'session/index'
  get 'users/index'
  get 'user/index'
  root 'home#index'
   match '/index', to: 'home#index', via: :get
   match 'signup', to: 'users#index', via: :get
   match 'users/create', to: 'users#create', via: :post
   match 'login', to: 'session#index', via: :get
   match 'session/create', to: 'session#create', via: :post
   match 'newblog', to: 'home#blog_create', via: :get
   match 'listblog', to: 'home#blog_list', via: :get
   post '/create_blog', to: 'home#create'
   match '/logout', to: 'session#logout', via: :get
   get '/comment/:id', to: 'home#comment'
   get 'destroy/:id',to: 'home#destroy'
   match '/comment_save', to: 'home#comment_save', via: :post
   get '/comment',to: 'home#comment'
   get '/myblogs',to: 'home#my_blogs'
   get '/error',to: 'home#error'
   get 'update/:id',to: 'home#update'
   post 'update_blog',to: 'home#update_blog'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
