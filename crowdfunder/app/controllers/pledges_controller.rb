class PledgesController < ApplicationController
  

  def new
    @pledge = Pledge.new(params[:id])
    @pledge = @project.pledges.new
  end

  def create
    
    @pledge = Pledge.new
    # @pledge = @project.pledges.build(pleadge_params)
    @pledge.user = current_user
    if @pledge.save
    # if @project.funded
    #   funded = @project.funded + @pledge.amount
    else
      funded = @pledge.amount
    end
    # @project.update_column(:funding_goal, funding_goal)
    #   redirect_to project_path, alert: "Pledged"
    else
      render 'projects/index'
    end
  end

  private

  def pledge_params

    

    params.require(:pledge).permit(:reward_id,:pledge_amount, :project_id)

  end




