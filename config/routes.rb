Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => "users/sessions",
    :registrations => "users/registrations"
  }
  devise_scope :user do
    root "users/sessions#new"
  end
  # devise_scope :user do
  #   get "/" => "users/sessions#new"
  #   end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "users/sessions#new"
  authenticated :user do
    root to: 'users/registrations#edit', as: :user_root
  end

  # root to: 'users/sessions#new'
end
