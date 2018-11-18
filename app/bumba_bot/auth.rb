require 'twitter'
require 'yaml'

module BumbaBot
  module Auth
    def directory
      # application root
    end

    def credentials
      YAML.load_file("#{directory}/.secrets.yml")["bumbabot"]["authentication"]["twitter"]
    end

    def client
      Twitter::REST::Client.new do |config|
        config.consumer_key        = credentials["api_key"]
        config.consumer_secret     = credentials["secret_key"]
        config.access_token        = credentials["access_token"]
        config.access_token_secret = credentials["access_token_secret"]
      end
    end
  end
end
