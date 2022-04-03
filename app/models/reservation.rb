class Reservation < ApplicationRecord

  belongs_to:user
  belongs_to:room

  validates :start_date, {presence:true}
  validates :end_date, {presence:true}
  validates :number_of_perple, {presence:true}
  
end
