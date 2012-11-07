class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  private
  def require_login
    unless login?
    	flash[:error] = "You must login to do this"
    	redirect_to "/no_permission.html"
    end
  end

  	def login?
	  session[:user_name] == User.first.name
	end
end
