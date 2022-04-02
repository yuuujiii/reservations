class Room < ApplicationRecord

  has_many:reservations

  mount_uploader :image, ImageUploader

  validates :image, {presence:true}
  validates :name, {presence:true}
  validates :address, {presence:true}
  validates :introduction, {presence:true}
  validates :price, {presence:true}
  
end
