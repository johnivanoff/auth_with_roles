AuthWithRoles::Application.routes.draw do |map|
  resources :roles

  resources :users
  
  resources :account, :controller => "users"
  
  controller :user_sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  match 'register', :to => 'users#new', :as => "register"

end
