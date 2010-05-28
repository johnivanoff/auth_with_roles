authorization do
  role :admin do
    has_permission_on [:roles, :users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  role :guest do
    has_permission_on :users, :to => [:index, :show]
  end
end