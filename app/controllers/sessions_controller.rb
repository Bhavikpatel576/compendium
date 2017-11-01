class SessionsController < ApplicationController

  def new
  end

  def destroy 
    log_out if logged_in?
    redirect_to root_url
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		#Log the person in and redirect them to their webpage
  		log_in user
      #Remember user checkbox 
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		#Rails automatically converts redirect_to user to the route user_url(user)
  		#redirect_to user
      redirect_back_or user
  	else
  		flash.now[:danger] = 'invalid email/password combination'
  		render 'new'
  	end 
  end

end
