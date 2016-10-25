class UsersController < ApplicationController
  # index
  # show
  # new
  # create
  # edit
  
  # UPDATE
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User successfully updated"
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
