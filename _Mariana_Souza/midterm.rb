

# key golnfTeAC9rf7RTwDzYzcA
#
# TACO CLOUT uses Yelp API to find tacos in your zip code. 
# Taco clout based on number of reviews times average rating
#http://www.yelp.com/developers/documentation/search_api

# array of taco places - empty array

class TacoClout

require 'rest-client'
require 'json'
require 'pry'

attr_accessor :list

	def initialize
		@tacolist = []
	end


	def get_yelp(zip_code)

		url = "http://api.yelp.com/business_review_search?category=restaurants&limit=10&term=taco&ywsid=golnfTeAC9rf7RTwDzYzcA"
	 	zip = "&location=#{zip_code}"
	 	results = url+zip

		yelp = JSON.load(RestClient.get(results))

		yelp["businesses"].map do |biz|
			name = biz["name"]
			address = biz["address1"]
			rating = biz["avg_rating"]
			review_count = biz["review_count"]
			clout = (rating.to_i)*(review_count.to_i)
			taco_joint = {name: "#{name}", clout: "#{clout}".to_i, address: "#{address}"} 
			# puts "New taco joint added! #{taco_joint}."
			@tacolist << taco_joint	
		end
		
		sorted = @tacolist.sort_by do |hash| 
			hash[:clout]
		end
		
		puts sorted.reverse
	end

end

# running program
puts "************* Welcome to Taco Clout ************* \n \n"

puts "Welcome to Taco Clout - enter your zip and recieve a list of 10 tacos joints and yelp clouts. \n \n"

puts "What is your zip code?"
	zip_code = gets.to_i

t1 = TacoClout.new 
t1.get_yelp(zip_code)
#t1.show_list

