module ApplicationHelper
	def login?
	  session[:user_name] == User.first.name
	end
  def related
    return posts=Post.all.sample(5)
  end
end
