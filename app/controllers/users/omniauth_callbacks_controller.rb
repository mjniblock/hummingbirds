class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
		service = Service.where(provider: auth.provider, uid: auth.uid).first

		#Look up an existing user with this facebook account
		if service.present?
			user = service.user


		# or we create a new user with this facebook account
		else
			user = User.create(
				email: auth.info.email,
				password: Devise.friendly_token[0,20]
			)

			user.services.create(
				provider: auth.provider,
				uid: auth.uid,
				expires_at: Time.at(auth.credentials.expires_at),
				access_token: auth.credentials.token,
			)
		end

		sign_in_and_redirect user, event: :authentication
		set_flash_message :notice, :success, kind: "Facebook"
	end
	
	def auth
		request.env['omniauth.auth']
	end
end