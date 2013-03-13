class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :password, :password_confirmation
  
  validates_uniqueness_of :email

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
