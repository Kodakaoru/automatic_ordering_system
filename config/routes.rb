Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 resources :products do
   collection do
     get 'fload'
     post 'search'
     get 'calculation'
   end
 end

 root 'products#index'
end
