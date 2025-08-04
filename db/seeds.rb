# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create exactly 3 users
user1 = User.find_or_create_by!(username: 'nature_lover') do |user|
  user.email = 'sarah@example.com'
  user.display_name = 'Sarah Green'
  user.avatar = 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face'
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

user2 = User.find_or_create_by!(username: 'coffee_addict') do |user|
  user.email = 'mike@example.com'
  user.display_name = 'Mike Rodriguez'
  # No avatar for this user
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

user3 = User.find_or_create_by!(username: 'cat_person') do |user|
  user.email = 'lisa@example.com'
  user.display_name = 'Lisa Park'
  user.avatar = 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face'
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

# Create exactly 3 tweets for each user (9 total tweets) with randomized timestamps
tweet1 = Tweet.find_or_create_by!(content: 'Nature is healing 🌿 Saw a family of deer in my backyard this morning. They just stood there eating my flowers like they own the place. I love it.', user: user1) do |tweet|
  tweet.media_url = 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&h=400&fit=crop'
  tweet.created_at = 2.days.ago + rand(0..23).hours + rand(0..59).minutes
  tweet.updated_at = tweet.created_at
end

tweet2 = Tweet.find_or_create_by!(content: 'This coffee is so good it should be illegal. Third cup today and I\'m not even sorry.', user: user2) do |tweet|
  tweet.media_url = 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=600&h=400&fit=crop'
  tweet.created_at = 1.day.ago + rand(0..23).hours + rand(0..59).minutes
  tweet.updated_at = tweet.created_at
end

tweet3 = Tweet.find_or_create_by!(content: 'My cat just knocked over my entire coffee cup and then looked at me like "what are you going to do about it?" I love her so much 😭', user: user3) do |tweet|
  tweet.media_url = 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=600&h=400&fit=crop'
  tweet.created_at = 12.hours.ago + rand(0..11).hours + rand(0..59).minutes
  tweet.updated_at = tweet.created_at
end

tweet4 = Tweet.find_or_create_by!(content: 'Nature is healing part 2: Just watched a squirrel successfully steal a bird\'s nest and turn it into a luxury condo. The audacity is inspiring.', user: user1) do |tweet|
  tweet.created_at = 8.hours.ago + rand(0..7).hours + rand(0..59).minutes
  tweet.updated_at = tweet.created_at
end

tweet5 = Tweet.find_or_create_by!(content: 'Found a new coffee shop that serves their lattes with tiny latte art. It\'s so cute I almost don\'t want to drink it. Almost.', user: user2) do |tweet|
  tweet.media_url = 'https://images.unsplash.com/photo-1541167760496-1628856ab772?w=600&h=400&fit=crop'
  tweet.created_at = 6.hours.ago + rand(0..5).hours + rand(0..59).minutes
  tweet.updated_at = tweet.created_at
end

tweet6 = Tweet.find_or_create_by!(content: 'My cat has learned to open doors. I\'m both impressed and terrified.', user: user3) do |tweet|
  tweet.media_url = 'https://images.unsplash.com/photo-1513360371669-4adf3dd7dff8?w=600&h=400&fit=crop'
  tweet.created_at = 4.hours.ago + rand(0..3).hours + rand(0..59).minutes
  tweet.updated_at = tweet.created_at
end

tweet7 = Tweet.find_or_create_by!(content: 'Nature is healing: The ducks at the park now recognize me and come running when I show up with bread. I\'ve created a bread dependency and I\'m not proud.', user: user1) do |tweet|
  tweet.created_at = 2.hours.ago + rand(0..1).hours + rand(0..59).minutes
  tweet.updated_at = tweet.created_at
end

tweet8 = Tweet.find_or_create_by!(content: 'Just finished a 5K and I\'m pretty sure I\'m dying. But in a good way? Maybe?', user: user2) do |tweet|
  tweet.created_at = 1.hour.ago + rand(0..59).minutes
  tweet.updated_at = tweet.created_at
end

tweet9 = Tweet.find_or_create_by!(content: 'Cats are the ultimate chaos agents and we love them for it.', user: user3) do |tweet|
  tweet.created_at = 30.minutes.ago + rand(0..29).minutes
  tweet.updated_at = tweet.created_at
end

# Create exactly 3 replies from each user (9 total replies) with randomized timestamps
# User 1 (Sarah) replies
reply1 = Tweet.find_or_create_by!(content: 'This is the most wholesome thing I\'ve read today. Nature really is healing! 🌱', user: user1, parent_tweet: tweet2) do |tweet|
  tweet.created_at = tweet2.created_at + rand(5..30).minutes
  tweet.updated_at = tweet.created_at
end

reply2 = Tweet.find_or_create_by!(content: 'Coffee is indeed life. I think I have coffee running through my veins instead of blood.', user: user1, parent_tweet: tweet3) do |tweet|
  tweet.created_at = tweet3.created_at + rand(5..45).minutes
  tweet.updated_at = tweet.created_at
end

reply3 = Tweet.find_or_create_by!(content: 'She\'s just asserting her dominance. Classic cat behavior.', user: user1, parent_tweet: tweet6) do |tweet|
  tweet.created_at = tweet6.created_at + rand(10..60).minutes
  tweet.updated_at = tweet.created_at
end

# User 2 (Mike) replies
reply4 = Tweet.find_or_create_by!(content: 'I feel this on a spiritual level. Coffee is life.', user: user2, parent_tweet: tweet1) do |tweet|
  tweet.created_at = tweet1.created_at + rand(15..90).minutes
  tweet.updated_at = tweet.created_at
end

reply5 = Tweet.find_or_create_by!(content: 'Cats are the ultimate chaos agents and we love them for it.', user: user2, parent_tweet: tweet3) do |tweet|
  tweet.created_at = tweet3.created_at + rand(20..120).minutes
  tweet.updated_at = tweet.created_at
end

reply6 = Tweet.find_or_create_by!(content: 'Third cup? Those are rookie numbers. You gotta pump those numbers up!', user: user2, parent_tweet: tweet5) do |tweet|
  tweet.created_at = tweet5.created_at + rand(5..40).minutes
  tweet.updated_at = tweet.created_at
end

# User 3 (Lisa) replies
reply7 = Tweet.find_or_create_by!(content: 'The deer are probably like "thanks for the free buffet, human" 😂', user: user3, parent_tweet: tweet1) do |tweet|
  tweet.created_at = tweet1.created_at + rand(30..180).minutes
  tweet.updated_at = tweet.created_at
end

reply8 = Tweet.find_or_create_by!(content: '10 miles? I get tired just thinking about that. Respect!', user: user3, parent_tweet: tweet8) do |tweet|
  tweet.created_at = tweet8.created_at + rand(2..15).minutes
  tweet.updated_at = tweet.created_at
end

reply9 = Tweet.find_or_create_by!(content: 'My cat has learned to open doors too! It\'s terrifying but impressive.', user: user3, parent_tweet: tweet6) do |tweet|
  tweet.created_at = tweet6.created_at + rand(15..90).minutes
  tweet.updated_at = tweet.created_at
end

# Create one reply to a reply (making it more realistic)
reply_to_reply = Tweet.find_or_create_by!(content: 'Exactly! They have no shame at all 😂', user: user1, parent_tweet: reply7) do |tweet|
  tweet.created_at = reply7.created_at + rand(5..30).minutes
  tweet.updated_at = tweet.created_at
end

# Create realistic likes distribution (some tweets get multiple likes, some get none)
# Popular tweets get multiple likes
Like.find_or_create_by!(user: user1, tweet: tweet1)  # Nature tweet - popular
Like.find_or_create_by!(user: user2, tweet: tweet1)  # Nature tweet - popular
Like.find_or_create_by!(user: user3, tweet: tweet1)  # Nature tweet - popular

Like.find_or_create_by!(user: user1, tweet: tweet3)  # Cat tweet - popular
Like.find_or_create_by!(user: user2, tweet: tweet3)  # Cat tweet - popular

Like.find_or_create_by!(user: user2, tweet: tweet5)  # Coffee art tweet
Like.find_or_create_by!(user: user3, tweet: tweet5)  # Coffee art tweet

Like.find_or_create_by!(user: user1, tweet: tweet6)  # Cat door tweet
Like.find_or_create_by!(user: user2, tweet: tweet6)  # Cat door tweet

# Some tweets get no likes (realistic)
# tweet2, tweet4, tweet7, tweet8, tweet9 get no likes

# Create realistic shares distribution (shares are rarer than likes)
# Only the most popular tweets get shared
Share.find_or_create_by!(user: user2, tweet: tweet1)  # Nature tweet - very popular
Share.find_or_create_by!(user: user3, tweet: tweet1)  # Nature tweet - very popular

Share.find_or_create_by!(user: user1, tweet: tweet3)  # Cat tweet - popular

Share.find_or_create_by!(user: user3, tweet: tweet5)  # Coffee art tweet

# Most tweets get no shares (realistic)
# tweet2, tweet4, tweet6, tweet7, tweet8, tweet9 get no shares

# Add a like to the reply-to-reply
Like.find_or_create_by!(user: user3, tweet: reply_to_reply)

puts "Seed data created successfully!"
puts "Created #{User.count} users and #{Tweet.count} tweets"
puts "Each user has 3 tweets and 3 replies, with realistic like/share distribution!"
