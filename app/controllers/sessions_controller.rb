class SessionsController < ApplicationController
    
  def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
  end
    
  def new
    
  end
  
  def show
    id = params[:id]
    @user = User.find(id)
  end
    
  def create
    
    if (@user = User.find_by(user_params))
      flash[:notice] = "You are logged in as #{user_params[:user_id]}"
      session[:session_token] = @user.session_token
      redirect_to movies_path
    else
      flash[:notice] = "invalid user-id/email combination"
      redirect_to login_path
    end
    
  end

  def destroy
    flash[:notice] = "Logged out"
    session[:session_token] = nil
    redirect_to movies_path
  end
    
end