desc "This task downloads new tweets that include the hubspot url"
task :download_tweets => :environment do
	puts "Updating database with tweets..."
  Tweet.get_latest
   puts "done."
end