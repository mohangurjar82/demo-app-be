class InvitationsController < Devise::InvitationsController
	def create
		user = User.invite!(email: params[:email], current_user)

		render json: {status:200, message:'successfully send invitations to that email'}
	end
end