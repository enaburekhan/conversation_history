class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project, notice: 'Comment was successfully created.' }
      end 
      
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("comments", partial: "comments/form", locals: { comment: @comment }) }
        format.html { redirect_to @project, alert: 'Comment could not be created.' }
      end  
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
