Rails.application.routes.draw do
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
  get '/login',to: 'sessions#new'
  #GET login_path： "/login"へアクセスされた際に"session#new"アクションを実行
  post '/login',to: 'sessions#create'
  #POST login_path： "session#create"アクションの情報を"/login"へ送信。
  delete '/logout',to: 'sessions#destroy'

  resources :users
  resources :account_activations, only:[:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]

end
