Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions, invitations: :invitations, registrations: :registrations },
                       path_names: { sign_in: :login }

    resource :user, only: [:show, :update]
  end
end
