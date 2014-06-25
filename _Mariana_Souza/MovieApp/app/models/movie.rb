class Movie < ActiveRecord::Base
	

	def self.search_for(query)
		where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
	end

	validates :title, :description, :year_released, :presence => true
	validates :description, :length => { :minimum => 10}
	validates :title, :uniqueness => true
	validates :year_released, :length => { :minimum => 4, message: "Please use a valid year."}
	
end
