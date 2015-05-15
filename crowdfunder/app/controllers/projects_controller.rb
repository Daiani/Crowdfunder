class ProjectsController < ApplicationController
before_filter :require_login, except: [:index]
	def index
		@projects = Project.all
	end

  def new
  	@project = Project.new
  	3.times { @project.rewards.build }
  end

  def show
    @project = Project.find(params[:id])  
  end

  def create
    @project = Project.new(project_params)
    
    if @project.save
    	redirect_to projects_path
    else
      render 'new'	
  	end
  end


 

private
def project_params
	params.require(:project).permit(:name, :description, :funding_goals, :start_date, :finish_date , rewards_attributes: [:amount, :description, :_destroy])
end


end


