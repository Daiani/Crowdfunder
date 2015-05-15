class ProjectsController < ApplicationController
before_filter :require_login, except: [:index, :show]

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

  if @project.save
  	redirect_to projects_url
  else
     render 'new'	
	end

def show
  @project = Project.find(params[:id])
end

def destroy
  @project = Project.find(params[:id])
  if @project.pledges.blank? == false
    flash[:alert] = "Project can't be deleted."
  else
  @project.destroy  
  flash[:notice] = "Project #{project.name} has been deleted."
end
  redirect_to projects_url

  end

end


 

private
def project_params
	params.require(:project).permit(:name, :description, :funding_goals, :start_date, :end_date , rewards_attributes: [:amount, :description, :_destroy])
end




