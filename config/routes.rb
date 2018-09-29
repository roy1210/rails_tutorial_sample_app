Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  #get '/home',to: 'static_pages/home' No longer to need since already set root 'static_pages#home'

  get '/help',to: 'static_pages#help',as:'helf'
  #演習5.3.3.1 help=>helfルーティング への名前変更　link_to "Help",helf_path　となる。
  get '/about',to: 'static_pages#about'
  get '/contact',to: 'static_pages#contact'

  get '/signup',to: 'users#new'
  #ユーザー登録用URLを初期値の/users/newから変更する。
  post '/signup',to: 'users#create'
  #User登録後に/usersではなく送信前と同じ/signupに行く
  resources :users
end
