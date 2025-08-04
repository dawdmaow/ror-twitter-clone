class AddMediaAndParentToTweets < ActiveRecord::Migration[8.0]
  def change
    add_column :tweets, :media_url, :string
    add_reference :tweets, :parent_tweet, null: true, foreign_key: { to_table: :tweets }
  end
end
