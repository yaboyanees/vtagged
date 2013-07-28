class Venue < ActiveRecord::Base
  
  attr_accessible :state, :name, :phone, :price, :street, :website, :city, :extra_charges, :min, :image
  acts_as_gmappable
  mount_uploader :image, ImageUploader
  
  has_reputation :votes, source: :user, aggregated_by: :sum
  
def gmaps4rails_address
  "#{self.city}, #{self.street}" 
end

def gmaps4rails_title
  "#{self.name}"
end

def gmaps4rails_marker_picture
 {
  "picture" => "/assets/marker_main.png",         
   "width" => 32,          
   "height" => 36,          
 }
end

end
