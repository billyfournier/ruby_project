class UsersController < ApplicationController
  # index
  # show
  # new
  # edit

  def create  # CREATE
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to groups_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  # DESTROY
  def destroy
    user = User.find(params[:id])
    user.destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation)
  end
end
