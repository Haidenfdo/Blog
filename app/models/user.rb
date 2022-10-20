class User < ApplicationRecord
    has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password,:presence => true,
  :confirmation => true,
  :length => {:within => 6..40},
  :on => :create
  has_one_attached :profile_image
end
