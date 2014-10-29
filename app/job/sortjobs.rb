# app/jobs/log_job.rb

class sortEu
  include SuckerPunch::Job

  def perform(event)
  	ActiveRecord::Base.connection_pool.with_connection do
	    @raw.each do |tweet|
	      if Tweet.eu_places.include?(tweet.userlocation)
	        @tweets << tweet
	      end
	    end
	    SuckerPunch::Queue(:sorteu_queue).async.perform(1)    
	end    
  end
end