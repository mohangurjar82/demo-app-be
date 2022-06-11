class RegistrationsController < Devise::RegistrationsController
	
  def create
    user = User.new(sign_up_params)

    if user.save
    	render json: { status: 200, message:'User is succesfully created' }
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
  	params.require(:user).permit(:id, :email, :password, :first_name, :last_name)
  end
end