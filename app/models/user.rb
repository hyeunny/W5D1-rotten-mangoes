class User < ActiveRecord::Base
serialize :roles, Array

has_many :reviews
has_secure_password

validates :email,
  presence: true

validates :firstname,
  presence: true

validates :lastname,
  presence: true

validates :password,
  length: { in: 4..20 }, on: :create

def full_name
  "#{firstname} #{lastname}"
end

end
