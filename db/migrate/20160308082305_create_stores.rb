class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :county_id
      t.integer :town_id
      t.integer :road_id
      t.integer :store_type
      t.string :store_code
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps null: false
    end
  end
end
