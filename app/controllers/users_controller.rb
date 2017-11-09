#class UsersController < ApplicationController
class UsersController < Clearance::UsersController
    private

    def new
      @user = User.new
      render template: "users/new"
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
