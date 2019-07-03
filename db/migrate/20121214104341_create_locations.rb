class CreateLocations < ActiveRecord::Migration[4.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :status
      t.string :comments
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
