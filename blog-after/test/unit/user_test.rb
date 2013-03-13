require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new( email: "example@email.com",
                      password: "1234",
                      password_confirmation: "1234"
                      )
  end
  test "should not save the same email" do
    @user.save
    invalid_user = User.new(  email: @user.email, 
                              password: "1234", 
                              password_confirmation: "1234")

    assert invalid_user.invalid?
    assert !invalid_user.save
  end

  test "should not save without password" do
    @user.password = ""
    @user.password_confirmation = ""
    assert @user.invalid?
    assert !@user.save
  end

  test "should not require password for update" do
    @user.save
    @user.email = "example2@email.com"
    assert @user.valid?
    assert @user.save
  end
  
end
