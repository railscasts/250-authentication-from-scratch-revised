class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation
  
  validates_uniqueness_of :email

  ######
  # The code below added by Nur Sah Ketene for writing appropriate tests
  # for user authentication for those who are interested to learn how to
  # test their applications. 

  ##
  # Validating presence of password on create. If you want to validate the password 
  # both on create and update remove "on: :create"
  ## 
  validates_presence_of :password, :password_confirmation, on: :create

  ##
  # Validating email format with regular expression
  ##
  validates_format_of   :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
