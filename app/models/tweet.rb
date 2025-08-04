class Tweet < ApplicationRecord
  belongs_to :user
  
  # Self-referential association for replies
  belongs_to :parent_tweet, class_name: 'Tweet', optional: true
  has_many :replies, class_name: 'Tweet', foreign_key: 'parent_tweet_id', dependent: :destroy
  
  # Likes and shares
  has_many :likes, dependent: :destroy
  has_many :shares, dependent: :destroy
  
  validates :content, presence: true, length: { maximum: 280 }
  
  scope :top_level, -> { where(parent_tweet_id: nil) }
  scope :replies, -> { where.not(parent_tweet_id: nil) }
  
  def is_reply?
    parent_tweet_id.present?
  end
  
  def is_thread?
    replies.any?
  end
  
  def thread_tweets
    return [self] unless is_thread?
    [self] + replies.order(:created_at)
  end
end
