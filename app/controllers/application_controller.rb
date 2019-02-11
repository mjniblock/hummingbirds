class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!


  def after_sign_out_path_for(resource_or_scope)
  	if resource_or_scope == :user 
      #changed now that homepage is established
      root_path
  	end
  end

  def after_sign_in_path_for(resource_or_scope)
  	#send user to their profile if it exists
    if current_user.profile.present?
      profile_path(current_user.profile.id) 
    
    #user creates profile - association of profile and user take care of needing automated profile creation
    else
      new_profile_path(current_user.id)
    end
  end
end
