class MembersController < ApplicationController
  def create
    Member.create(user:User.find(session[:user_id]), group:Group.find(params[:id]))
    redirect_to :back
  end
  def destroy
    member = Member.find(params[:id])
    member.destroy
    redirect_to :back
  end
end
