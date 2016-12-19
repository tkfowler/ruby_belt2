class MembersController < ApplicationController
  before_action :require_login
  def add
    @member = Member.create(user_id:current_user.id, group_id:params[:id])
    redirect_to "/groups/#{params[:id]}"
  end

  def destroy
    @member = Member.find_by(user_id:current_user.id, group_id:params[:id])
    @member.destroy
    redirect_to "/groups/#{params[:id]}"
  end
end
