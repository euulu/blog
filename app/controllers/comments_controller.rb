class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    if @comment.save
      redirect_to @post
    else
      render @post, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
