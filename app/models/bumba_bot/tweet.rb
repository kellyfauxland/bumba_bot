module BumbaBot
  class Tweet
    attr_reader :twitter_id, :text, :entities, :twitter_created, :author

    def initialize(attrs)
      @twitter_id = attrs[:id]
      @text = attrs[:text]
      @entities = attrs[:entities]
      @twitter_created = attrs[:created_at]
      @author = attrs[:user]
    end
  end
end
