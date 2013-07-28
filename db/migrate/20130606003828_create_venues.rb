class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :state
      t.string :name
      t.string :street
      t.string :city
      t.string :price
      t.string :phone
      t.string :website
      t.string :extra_charges
      t.string :min
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end
