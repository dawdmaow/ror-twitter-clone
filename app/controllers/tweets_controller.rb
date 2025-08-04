class TweetsController < ApplicationController
  before_action :require_login, only: [:create, :like, :unlike, :share, :unshare]

  def index
    @tweets = Tweet.top_level.includes(:user, :likes, :shares).order(created_at: :desc)
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.includes(:user, :likes, :shares).find(params[:id])
    @replies = @tweet.replies.includes(:user, :likes, :shares).order(:created_at)
  end

  def new
    @tweet = Tweet.new
    @parent_tweet = Tweet.find(params[:parent_id]) if params[:parent_id]
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    
    if @tweet.save
      redirect_to @tweet.parent_tweet || tweets_path, notice: 'Reet posted successfully!'
    else
      @parent_tweet = Tweet.find(params[:tweet][:parent_tweet_id]) if params[:tweet][:parent_tweet_id]
      render :new, status: :unprocessable_entity
    end
  end

  def like
    @tweet = Tweet.find(params[:id])
    @like = @tweet.likes.find_or_create_by(user: current_user)
    redirect_back(fallback_location: tweets_path)
  end

  def unlike
    @tweet = Tweet.find(params[:id])
    @tweet.likes.where(user: current_user).destroy_all
    redirect_back(fallback_location: tweets_path)
  end

  def share
    @tweet = Tweet.find(params[:id])
    @share = @tweet.shares.find_or_create_by(user: current_user)
    redirect_back(fallback_location: tweets_path)
  end

  def unshare
    @tweet = Tweet.find(params[:id])
    @tweet.shares.where(user: current_user).destroy_all
    redirect_back(fallback_location: tweets_path)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :media_url, :parent_tweet_id)
  end
end
