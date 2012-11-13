class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  layout "post_layout"
   
  skip_before_filter :require_login, :only=>[:index,:show,:search]
  caches_page :index, :show, :search
  cache_sweeper :posts_sweeper, :only=>[:create, :update,:destroy]

  def index
    @posts = Post.paginate(:page=>params[:page],:per_page=>10).order('created_at DESC')
    @username = session[:user_name]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  
  def search
    keyword = params[:keyword]
    @posts = Post.find_by_sql "select * from posts where name LIKE \"%#{keyword}%\" limit 10"
  end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find_by_permalink(params[:id])
    @id = @post.id
    @post_next = Post.find(@id + 1) rescue nil
    @post_prev = Post.find(@id - 1) rescue nil
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find_by_permalink(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find_by_permalink(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
