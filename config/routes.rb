Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  devise_for :users,
    controllers: { registrations: 'registrations' }
  root to: "homes#top"
  get 'home/about' => 'homes#about'
  resources :users, only: [:index, :edit, :update, :show]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  post 'favorites/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorites/:id' => 'favorites#destroy', as: 'destroy_favorite'
  post 'comments/:id' => 'book_comments#create', as: 'create_comment'
  delete 'comments/:id' => 'book_comments#destroy', as: 'destroy_comment'
end
