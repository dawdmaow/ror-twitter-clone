class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Account created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @parent_less_tweets = @user.tweets.where(parent_tweet_id: nil).order(created_at: :desc)
    @replies = @user.tweets.where.not(parent_tweet_id: nil).order(created_at: :desc)
    @shares = @user.shares.includes(:tweet).order(created_at: :desc)
    @likes = @user.likes.includes(:tweet).order(created_at: :desc)
  end

  def login
    if request.get?
      # Display login form
    else
      # Handle login form submission
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully!'
      else
        redirect_to login_path, alert: 'Invalid username or password'
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully!'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :display_name, :avatar, :password, :password_confirmation)
  end
end
