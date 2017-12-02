module ApplicationHelper

<<-PAGE	
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end
	
	def logged_in?
		if session[:user_id]
			return true
		else
			return false
		end
	end
PAGE
end
