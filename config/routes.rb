Rails.application.routes.draw do
  # Root route
  root "customers#index"

  # Custom customer routes
  get "customers/alphabetized", to: "customers#alphabetized", as: "alphabetized_customers"
  get "customers/missing_email", to: "customers#missing_email", as: "missing_email_customers"

  # ActiveAdmin and Devise
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
