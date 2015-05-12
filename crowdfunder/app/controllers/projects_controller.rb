class ProjectsController < ApplicationController

	def index
		@projects = Project.all

	end


def new
	@project = Project.new

end


def create
	@project = Project.new(project_params)

  if @project.save
  	redirect_to projects_url
  else
     render 'new'	
	end

private
def project_params
	params.require(:project).permit(:name, :description)

end

end

end
