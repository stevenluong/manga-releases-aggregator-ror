class ApplicationController < ActionController::Base
  protect_from_forgery
	def out
    if !user_signed_in? || current_user.id!=1
      redirect_to root_path, notice: "well tried, but no"
		end
	end	
end
