class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    post.likes.create(user: current_user)
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find(params[:id])
    like.destroy if like
    redirect_to root_path
  end
end
