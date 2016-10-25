class GroupsController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    @groups = Group.all
  end

  def show
    @user = User.find_by_id(session[:user_id])
    @group = Group.find(params[:id])
    if @group.members.where(user:@user)[0]
      @member_id = @group.members.where(user:@user)[0].id
    else
      @member_id = nil
    end
  end

  def create
    group =Group.new(name:params[:group][:name], description:params[:group][:description], user_id:session[:user_id])
    if group.save
      redirect_to groups_path
    else
      flash[:errors] = group.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
  end

  private
  def group_params
    Group.require(:group).permit(:name)
  end
end
