class TagsController < ApplicationController
	layout "post_layout"
	skip_before_filter :require_login
  def index
  end

  def show
  	@tag = params[:tag_name]
  	@posts = Post.tagged_with(@tag).paginate(:page => params[:page], :per_page => 20)
  end
end
