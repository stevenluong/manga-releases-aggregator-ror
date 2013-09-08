class ApplicationController < ActionController::Base
  protect_from_forgery
	def out
    if !user_signed_in? || !current_user.is_admin
      redirect_to root_path, alert: "Well tried ! But No."
		end
	end	
end
