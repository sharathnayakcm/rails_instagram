class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit post_likes post_comments update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = get_all_recent_posts(10)
  end

  def user_posts
    # finding all the posts
    post_ids = Like.user_liked_posts(params[:id])
    # Bad Code need to refactor need to find way to add 3 table like nested models
    @posts = []
    post_ids.each do |post|
      @posts << Post.find(post.post_id)
    end

    render "index"
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def post_likes
    @like = @post.likes.build(user_id: current_user.id)
    @posts = get_all_recent_posts(10)
    respond_to do |format|
      if @like.save
        format.js { render partial: 'posts/post' }
      end
    end
  end

  def post_comments
    @comment = @post.comments.build(user_id: current_user.id)
    @comment.body = params[:body]
    @posts = get_all_recent_posts(10)
    respond_to do |format|
      if @comment.save
        format.js { render partial: 'posts/post' }
      end
    end
  end


  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def get_current_user_recent_posts(size)
      current_user.posts.order(created_at: :desc).limit(size)
    end

    def get_user_recent_posts(user_id,size)
      user = User.find(user_id)
      user.posts.order(created_at: :desc).limit(size)
    end


    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description, :user_id,:image)
    end
end
