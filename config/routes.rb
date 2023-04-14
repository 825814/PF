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

    post '/answers/confirm' => 'answers#confirm', as: 'confirm'
    get '/answers/complete' => 'answers#complete', as: 'complete'

    resources :questions do
      resources :answers, only: [:new, :create]
    end
  end

  namespace :admin do

    # root to: "questions#index"
    get '/admin' => "questions#index"

    resources :questions, only: [:new, :create, :index]
    resources :choices, only: [:new, :create, :index]

    get '/questions/:question_id' => "answers#index"
    get '/questions/:question_id/choices/:choice_id/' => "answers#show"
    # resources :answers, only: [:index, :show]

    # resources :questions, only: [:new, :create, :index, :show]

  end
end
