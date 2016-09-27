class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:user_id, :email, :session_token, :timestamps)
  end
  
  def show
    id = params[:user_id]
    @user = User.find(id)
  end
  
  def index
    @users = User.all
  end
  
  def new
    # default: render 'new' template
  end
    
  def create
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.user_id} was successfully created."
    redirect_to users_path
  end
  
  def edit
    @user = User.find params[:user_id]
  end
  
  def update
    @user = User.find params[:user_id]
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@movie.title} was successfully update."
    redirect_to user_path(@user)
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @user.destroy
    flash[:notice] = "User '#{user.title}' deleted."
    redirect_to users_path
  end
  
end