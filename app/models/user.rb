class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, uniqueness: true 
  has_many :shouts, dependent: :destroy
end


# valides is a method that just makes sure things have been entered
