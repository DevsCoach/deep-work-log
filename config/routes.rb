Rails.application.routes.draw do
  root "log_entries#index"

  resources :log_entries do
    post "end", on: :member
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
