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

  test "should get edit" do
    @user.save
    get :edit, id: @user.id
    assert :success
  end

  test "should update user" do
    @user.save
    put :update, id: @user.id, user: { email: "changed@email.com" }
    assert_response :redirect
    assert_redirected_to root_url
    assert_equal "Your information is updated!", flash[:notice]
  end

  test "should not update user with invalid params" do
    @user.save
    put :update, id: @user.id, user: { email: "invalid" }
    assert_template :edit
  end
end
