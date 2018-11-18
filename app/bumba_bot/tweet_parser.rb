class BumbaBot::TweetParser
  FIELD_MAP = %i[id text entities created_at user].freeze

  def initialize(twitter_tweet)
    @twitter_tweet = twitter_tweet
  end

  def parse
    puts "Parsing #{@twitter_tweet.class} : #{@twitter_tweet.id}"
    values = extract_values(@twitter_tweet)
    attrs  = values_to_hash(values)
  end

  private

  def extract_values(result)
    result.attrs.values_at(*FIELD_MAP)
  end

  def values_to_hash(values)
    FIELD_MAP.zip(values).to_h
  end
end
