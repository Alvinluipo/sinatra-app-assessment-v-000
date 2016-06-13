class User < ActiveRecord::Base
  has_many :items
  has_many :shops, through: :items

  has_secure_password
end