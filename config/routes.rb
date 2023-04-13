Rails.application.routes.draw do

  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers, skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
      sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    resources :questions do
      resources :answers, only: [:new, :create]
    end
  end

  namespace :admin do

    root to: "questions#index"
    resources :questions do
      resources :answers, only: [:create]
      # resources :choices, only: [:create]
    end

    # resources :answers, only: [:create] do
    #   resources :questions
    #   resources :choices, only: [:create]
    # end

    # resources :questions, only: [:new, :create, :index, :show]

  end
end
