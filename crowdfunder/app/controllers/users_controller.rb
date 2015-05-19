class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
      @user = User.new(user_params)
    if @user.save
      redirect_to projects_path, alert: "The user has been created!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    pledgesforuser=Pledge.where(user_id: @user.id)
    # project_ids=pledgesforuser.map {|x| x.project_id}
    # project_ids.uniq!
    # @projects=Project.find(project_ids)
    @projects=@user.backed_projects.uniq
  end



  def user_params
    params.require(:user).permit(:email, :id, :password, :password_confirmation, :first_name, :last_name, :avatar)
  end
end
