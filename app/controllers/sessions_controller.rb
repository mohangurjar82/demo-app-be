class SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(params[:email])

    if user && user.valid_password?(params[:password])
      @current_user = user
      render json: { status:200, message: 'Successfully Login', user: user }
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
end