class RemoveLongitudeFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :longitude, :float
  end
end
