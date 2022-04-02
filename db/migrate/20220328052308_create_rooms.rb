class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :image
      t.string :name
      t.string :address
      t.string :introduction
      t.integer :price

      t.timestamps
    end
  end
end
