require 'Twitter'

$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key       = 'BBgeLJEeb1hbHJv1prbujRotH'
  config.consumer_secret    = 'xz15WfKq9z2O7NYbS9jiCDH0Hjo78T7NYKEBZu5NARQ4wgVgFy'
end

$twitter.bearer_token