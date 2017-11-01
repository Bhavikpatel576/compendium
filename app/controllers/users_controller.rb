class UsersController < ApplicationController
  #create a before filter
  #invokes the logged_in_user method to be called before others
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end 

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create #how to do I create a user through the form. Take input variable -> put into database
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      flash[:success] = "Profile Update"
  		redirect_to @user
  	else 
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #handle a successful update
      flash[:success] = "Profile update"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private 

	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end
  #Before filters

  #Confirms a logged-in user
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  #Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
