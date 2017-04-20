Rails.application.routes.draw do
  resources :topics do
    resource :posts, except: [:index]
  end

  get 'about' => 'welcome#about'
  
  root 'welcome#index'
  
end
