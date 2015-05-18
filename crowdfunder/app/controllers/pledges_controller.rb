class PledgesController < ApplicationController

  def new
    @pledge = Pledge.new
    @project = Project.find(params[:project_id])
  end

  def create
    
    @pledge = Pledge.new(pledge_params)
    @pledge.user_id = current_user.id
    reward = Reward.find(pledge_params[:reward_id])
    if @pledge.save
      redirect_to project_path(reward.project_id), alert: "The pledge has been created!"
    else
      render "new"
    end
  end

  def pledge_params
    params.require(:pledge).permit(:reward_id,:pledge_amount, :project_id)
  end
end



