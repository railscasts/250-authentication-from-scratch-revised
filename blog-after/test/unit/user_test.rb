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
    invalid_user = User.new(  email: user.email, 
                              password: "1234", 
                              password_confirmation: "1234")

    assert invalid_user.invalid?
    assert !invalid_user.save
  end

  test "should not save without password" do
    @user.password = ""
    assert @user.invalid?
    assert !@user.save
  end
  
end
