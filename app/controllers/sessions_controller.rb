class SessionsController < ApplicationController
  skip_before_filter :require_login
  def new
    if params[:name] == User.first.name and params[:password] == User.first.password
  		session[:user_name] = User.first.name
  		redirect_to "/"
  	end
  end

  def create

  end

  def destroy
    session[:user_name] = nil
    redirect_to "/"
  end
end
