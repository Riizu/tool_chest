class User < ActiveRecord::Base
  has_secure_password
  has_many :tools

  validates :username, presence: true,
                       uniqueness: true

  validates :password, presence: true

  enum role: ["default", "admin"]
end
