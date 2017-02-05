Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#  get 'pages/home', to: 'pages#home' http://0.0.0.0:3000/pages/home
#  get 'pages/about', to: 'pages#about'

  root 'pages#home' #http://0.0.0.0:3000/
  get 'about', to: 'pages#about' #http://0.0.0.0:3000/about

  resources :articles # gave us a new article actions.... new, edit, delete..etc
end
