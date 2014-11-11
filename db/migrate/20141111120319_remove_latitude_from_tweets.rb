class RemoveLatitudeFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :latitude, :float
  end
end
