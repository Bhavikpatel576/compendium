require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
 
 def setup
 	@user = users(:bhavik)
 end

  test "test for invalid login" do
  	get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: { email: " ", password: " "} }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)

    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "login with remembering" do 
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token']
  end

  test "login without remembering" do 
    # Log in to set the cookie. 
    log_in_as(@user, remember_me: '1')
    # Log in again and make sure the cookie is deleted
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end

end

=begin
test needs to capture the following. 
1. Visit the login path
2. Verify that the new sessions form renders properly 
3. Post to the sessions path with an invalid params hash
4. Verify that the new sessions form gets re-rendered adn that a flash message appears
5. Vist another page
6. Verify that the flash message doesn't appear on the new page

=end