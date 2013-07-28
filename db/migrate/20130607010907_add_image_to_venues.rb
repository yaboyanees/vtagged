class AddImageToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :image, :string
  end
end
