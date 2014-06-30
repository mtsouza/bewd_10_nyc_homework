class Link < ActiveRecord::Base
	
	validates :link, :presence => true
	validates :hashcode, :uniqueness => true
	
end
