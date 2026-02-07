class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    post.comments.create(
      body: params[:comment][:body],
      user: current_user
    )
    redirect_to root_path
  end
end
