Rails.application.routes.draw do

  #ユーザー側
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root to: "homes#top"
    resources :users, only:[:index, :show, :edit, :update]
    resources :shooes, only:[:new, :create, :index, :show, :edit, :update, :destroy]
    resources :post_images, only: [:new, :create, :index, :show, :destroy]
    resources :post_comments, only: [:create]
  end

  #管理者側
  devise_for :admins,  skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: "homes#top"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
