# app/workers/eu_sort.rb
class EuSort
  include Sidekiq::Worker

  def perform(id)
    t = Tweet.find(id)
    if Tweet.eu_places.include?(t.userlocation)
    	@tweets << t
    end
  end
end