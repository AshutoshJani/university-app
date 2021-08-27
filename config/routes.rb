Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  post 'courses/new', to: 'courses#create'
  get 'about', to: 'pages#about'
  resources :students, except: [:destroy]
  get 'login', to: 'login#new'
  post 'login', to: 'login#create'
  get 'logout', to: 'login#destroy'
  post 'enroll_course', to: 'student_courses#create'
end