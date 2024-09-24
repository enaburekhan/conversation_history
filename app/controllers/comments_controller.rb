class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @project, notice: 'Comment was successfully created.'
    else
      redirect_to @project, alert: 'Comment could not be created'  
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
