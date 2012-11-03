module ApplicationHelper
	def login?
	  session[:user_name] == User.first.name
	end
end
