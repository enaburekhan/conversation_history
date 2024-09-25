class ProjectsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
      @projects = Project.order(updated_at: :desc)
    end

    def show
      @comments = @project.comments
      @comment = Comment.new
    end

    def new
      @project = Project.new  
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        redirect_to @project, notice: "Project was successfully created"
      else
        render :new  
      end    
    end

    def edit
    end

    def update
      @project = Project.find(params[:id])

      if @project.update(project_params)
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace('project_status', partial: "projects/project_status", locals: { project: @project }) }
          format.html { redirect_to @project, notice: 'Project status was sucessfully updated.' }
        end
      else
        render :edit  
      end    
    end

    def destroy
      @project.destroy
      redirect_to projects_url, notice: "Project was successfully deleted."
    end

    private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :status)    
    end
end
