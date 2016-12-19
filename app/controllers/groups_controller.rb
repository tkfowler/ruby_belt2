class GroupsController < ApplicationController
  before_action :require_login
  before_action :require_correct_user, only: [:destroy]
  def index
    @groups = Group.all
  end

  def create
    @groups = Group.create( group_params )
    Member.create(user_id:@groups.user_id, group_id:@groups.id)
    if @groups.valid?
      redirect_to '/groups'
    else
      flash[:errors] = @groups.errors.full_messages
      redirect_to '/groups'
    end
  end

  def show
    @group = Group.find(params[:id])
    @user = User.find(@group.user_id)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to '/groups'
  end

  private
  def group_params
    params.require(:group).permit(:name, :description, :user_id)
  end
end
