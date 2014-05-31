![GeneralAssemb.ly](https://github.com/generalassembly/ga-ruby-on-rails-for-devs/raw/master/images/ga.png "GeneralAssemb.ly")

Back-End Web Development
--------

##MIDTERM  REQUIREMENTS

Create a command line based application that fulfills these criteria:

-  Takes user input and handles bad input (i.e. You expect numbers and they give you a letter).
-   Connects to a 3rd party api where the call varies based on what the user gives you.
-   Must be object oriented. You must instantiate modeled classes. The only file that can run without classes is your runner.
-   Push code on Github.


##GRADING
Your midterm is considered completed if it meets all requirements above. Your instructor and T.A will provide you with feedback.


API Ideas:

*   omdapi.com
*   Twitter search api

http://www.yelp.com/developers/documentation/search_api#searchHood

yelp = JSON.load(RestClient.get("http://api.yelp.com/business_review_search?term=taco&location=11215&ywsid=golnfTeAC9rf7RTwDzYzcA"))

yelp = JSON.load(RestClient.get("http://api.yelp.com/business_review_search?category=restaurants&term=taco&location=11215&radius=5&limit=5&ywsid=golnfTeAC9rf7RTwDzYzcA"))

yelp["businesses"].first["avg_rating"]
yelp["businesses"].first["name"]
yelp["businesses"].first["address1"]