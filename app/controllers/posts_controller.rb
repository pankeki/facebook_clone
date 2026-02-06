class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: "Post created!"
    else
      render :new
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
