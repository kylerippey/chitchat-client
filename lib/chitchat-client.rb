require "faraday"
require "chitchat-client/version"
require "chitchat-client/chat"
require "chitchat-client/user"

module Chitchat
  module Client

    class << self
      attr_reader :host

      def host=(host)
        @host = host
        @conn = nil
      end

      def connection
        @conn ||= Faraday.new(:url => @host) do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          faraday.response :logger                  # log requests to STDOUT
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end
  end
end
