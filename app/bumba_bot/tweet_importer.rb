class BumbaBot::TweetImporter
  include BumbaBot::Auth

  attr_reader :import, :bumba_tweets

  def initialize(user_name)
    @user_name  = user_name
    @tweets = client.search("from:#{@user_name}")
  end

  def import
    puts "Getting imports ..."
    @import = @tweets.map do |tweet|
      puts "Importing tweet | #{tweet.id}"
      BumbaBot::TweetParser.new(tweet).parse
    end
    @bumba_tweets = @import.map { |attrs| BumbaBot::Tweet.new(attrs) }
  end
end
