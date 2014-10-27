class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweeturl
      t.string :handle
      t.string :name
      t.string :bio
      t.string :userlocation
      t.string :country

      t.timestamps null: false
    end
  end
end
