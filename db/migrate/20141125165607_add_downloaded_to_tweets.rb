class AddDownloadedToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :downloaded, :string
  end
end
