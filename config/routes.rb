Rails.application.routes.draw do
  get 'view/index'

  get 'view/show'

  get 'view/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :superusers, :skip => [:registrations] 
  as :superuser do
  get 'superusers/edit' => 'devise/registrations#edit', :as => 'edit_superuser_registration'
  put 'superusers' => 'devise/registrations#update', :as => 'superuser_registration'
  end
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :writers

  resources :publications
  get 'static/guide'
  get 'static/about'

  get 'static/terms'

  get 'home/index'
  get 'home/mine'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  # devise_for :writers, :path => '', :path_names => {:sign_up => 'become_a_writerx'}
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
