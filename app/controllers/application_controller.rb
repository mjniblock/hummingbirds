class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  def after_sign_out_path_for(resource_or_scope)
  	if resource_or_scope == :user 
  		new_user_session_path
  	#elsif resource_or_scope == :admin
  	#	new_admin_session_path
  	#else
  	#	root_path
  	end
  end

  def after_sign_in_path_for(resource_or_scope)
  	#must create profile for new user here before redirecting to porfile path

    #or send user to current profile

    profile_path(current_user.id) #hardcoded, must be changed to be dynamic
  end
end
