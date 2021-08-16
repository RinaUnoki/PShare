class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :image_id
      t.integer :price
      t.string :adress
      t.date :StartDate
      t.date :EndDate

      t.timestamps
    end
  end
end
