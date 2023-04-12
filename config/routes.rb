Rails.application.routes.draw do

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
  end

  namespace :admin do

    root to: "questions#index"
    get "/questions" => "questions#index"
    get "/questions/new" => "questions#new"
    post "/questions" => "questions#create"
    get "/questions/:id" => "questions#show"

    # resources :questions, only: [:new, :create, :index, :show]

  end
end
