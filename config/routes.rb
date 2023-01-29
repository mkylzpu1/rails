Rails.application.routes.draw do
  resources :cats
  devise_for :users, :controllers => {
    :sessions => "users/sessions",
    :registrations => "users/registrations"
  }

  # 認証されている場合のルート
  authenticated :user do
    root to: 'users/registrations#edit', as: :user_root
  end

  # 認証されていない場合のルート
  devise_scope :user do
    root "users/sessions#new"
    get 'users/lists', to: 'users/lists#index'
  end

  # letter_opener_web関連
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
