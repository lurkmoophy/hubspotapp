json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :tweeturl, :handle, :name, :bio, :userlocation, :country
  json.url tweet_url(tweet, format: :json)
end
