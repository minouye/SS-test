class SiteController < ApplicationController
  def index

  	client = Twitter::REST::Client.new do |config|
		  config.consumer_key        =  ENV['TWITTER_KEY']
		  config.consumer_secret     =  ENV['TWITTER_SECRET']
		  config.access_token        =  ENV['TWITTER_ACCESS_TOKEN']
		  config.access_token_secret =  ENV['TWITTER_ACCESS_SECRET']
		end


		if !params[:q]
			query = "stacksocial"
		else
			query = params[:q]
		end
  	@query = query

		if current_user
  		@tweets = client.search(query) 
  	end
  end

  def tweets
  	client = Twitter::REST::Client.new do |config|
		  config.consumer_key        =  ENV['TWITTER_KEY']
		  config.consumer_secret     =  ENV['TWITTER_SECRET']
		  config.access_token        =  ENV['TWITTER_ACCESS_TOKEN']
		  config.access_token_secret =  ENV['TWITTER_ACCESS_SECRET']
		end

		if !params[:screenname]
			user = "stacksocial"
		else
			user = params[:screenname]
		end
  	@tweets = client.user_timeline(user) 
  	@screenname = user

 	end
end
