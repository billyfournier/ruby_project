class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:Email])

    if user && user.authenticate(params[:Password])
      session[:user_id] = user.id
      redirect_to groups_path          # Go here if login is successful
    else
      flash[:errors] = ["Invalid combination"]
      redirect_to sessions_new_path
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end
end
