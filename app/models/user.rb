class User < ApplicationRecord

  has_many:reservations
  
  has_secure_password

  mount_uploader :image, ImageUploader

  validates :name, presence:true
  validates :email, presence:true, uniqueness:true
  validates :password, presence:true, length: {minimum: 8}

end
