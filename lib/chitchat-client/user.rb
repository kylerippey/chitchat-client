module Chitchat
  module Client
    class User
      attr_accessor :identifier

      class << self
        def find(id)
          response = Chitchat::Client.connection.get("/users/#{id}.json")
          return nil unless response.status == 200 && response.headers['content-type'] == "application/json"
          identifier = id
          self
        end
      end

      def initialize(id)
        identifier = id
        sign_on
        self
      end

      def sign_on
        Chitchat::Client.connection.put("/users/#{identifier}/sign_on.json")
      end

      def sign_off
        Chitchat::Client.connection.put("/users/#{identifier}/sign_off.json")
      end

      def status
        response = connection.get("/users/#{identifier}.json")
        response.body[:user][:status]
      end

      def available?
        status == "available"
      end

    end
  end
end
