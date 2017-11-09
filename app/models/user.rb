class User < ApplicationRecord
  include Clearance::User
  
  validates :username, presence: true, uniqueness: true 
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: { maximum: 255 },
  #                  format: { with: VALID_EMAIL_REGEX },
  #                  uniqueness: { case_sensitive: false }
  #has_secure_password
  #validates :password, presence: true, length: { minimum: 6}, allow_nil: true

end


# valides is a method that just makes sure things have been entered
