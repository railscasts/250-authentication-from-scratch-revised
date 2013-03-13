require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = User.new( email: "example@email.com",
                     password: "1234",
                     password_confirmation: "1234")
  end

  test "should get new" do
    get :new
    assert :success
  end

  test "should get create" do
    assert_difference("User.count") do
      post :create, user: { email: @user.email,
        password: @user.password,
        password_confirmation: @user.password_confirmation}
    end
    assert_redirected_to root_url
    assert_equal "Thank you for signing up!", flash[:notice]
  end

  test "should not create with invalid params" do
    assert_no_difference("User.count") do
      post :create, user: { email: "invalid", password: "12", password_confirmation: "123"}
    end

    assert_template :new
  end

end
