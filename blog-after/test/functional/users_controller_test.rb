require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = User.new( email: "example@email.com",
                      password: "1234",
                      password_confirmation: "1234")
  end
 
end
