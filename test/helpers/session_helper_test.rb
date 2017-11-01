=begin 

1. define a suwer variable using fixtures
2. call the remember method to remember the user
3. verify the current_user is equal to the given user

=end 

require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

	def setup
		@user = users(:bhavik)
		remember(@user)
	end

	test "current_user returns right user when session is nil" do 
		assert_equal @user, current_user
		assert is_logged_in?
	end

	test "current_user returns nil when remember digest is wrong" do 
		@user.update_attribute(:remember_digest, User.digest(User.new_token))
		assert_nil current_user
	end
end
