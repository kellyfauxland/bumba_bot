require 'sidekiq'

class BumbaBot::Worker
  include Sidekiq::Worker

  def perform(options = {})
    import_tweets
  end

  private

  def import_tweets
    BumbaBot::TweetImporter.new(options).import
  end
end
