class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :brand
      t.string :type
      t.integer :passenger
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
