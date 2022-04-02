class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :room_id
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.integer :number_of_perple
      t.integer :total_amount

      t.timestamps
    end
  end
end
