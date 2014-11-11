class Tweet < ActiveRecord::Base
	validates :handle, uniqueness: true

	def self.eu_places
		["Andorra", "Albania", "Austria", "Bosnia-Hercegovina", "Belgium", "Bulgaria", "Belarus", "Switzerland", "Cyprus", "Czech Republic", "Germany", "Denmark", "Estonia", "Spain", "Finland", "Faroe Islands", "France", "Guernsey", "Gibraltar", "Greece", "Croatia", "Hungary", "Ireland", "Isle of Man", "Iceland", "Italy", "Jersey", "Liechtenstein", "Lithuania", "Luxemburg", "Latvia", "Monaco", "Moldova", "Macedonia", "Malta", "Netherlands", "Norway", "Poland", "Portugal", "Romania", "Russia", "Sweden", "Slovenia", "Svalbard", "Slovakia", "San Marino", "West Turkey", "Ukraine", "Vatican City", "Yugoslavia"]
	end

	def self.us_places
		["United States of America", "United States"]
	end

	def self.uk_places
		["United Kingdom"]
	end	

	def self.get_latest

	    $twitter.search("hubs.ly", :result_type => "recent").each do |row|
	        coordlocation = row.place::country
	        description = row.user::description.gsub(",","")
	        biolocation = row.user::location	       
	      	if coordlocation.nil?
	        	coordlocation = "coordinates not provided"
	      	end
	      	uk = 'N'
	      	eu = 'N'
	      	us = 'N'

	      	location = Geocoder.search(biolocation)
	      	if location.first
	      		country = location.first.country
	      	else
	      		country = 'NULL'
	      	end

	  		if Tweet.uk_places.include?(country)
	  			uk = "Y"
	  		end
	  		if Tweet.eu_places.include?(country)
	  			eu = "Y"
	  		end
	  		if Tweet.us_places.include?(country)
	  			us = "Y"
	  		end


	      	
	      	
      		unless row.text.include? "RT"
			        t = Tweet.new(
			            tweeturl: "http://twitter.com/#{row.user::screen_name}/status/#{row.id}", 
			            handle: "#{row.user::screen_name}", 
			            name: "#{row.user::name}", 
			            bio: "#{description}", 
			            userlocation: "#{biolocation}", 
			            country: "#{coordlocation}",
			            uk: "#{uk}", 
			            eu: "#{eu}", 
			            us: "#{us}", 
			            )
			        t.save
		    end		    	    	
		end		
	end

	


end
