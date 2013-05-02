require 'json'

module Chitchat
  module Client
    class User
      attr_accessor :identifier

      class << self
        def find(id)
          response = connection.get("/users/#{id}.json")
          return nil unless response.status == 200 && response.headers['content-type'] =~ /application\/json/
          Chitchat::Client::User.new(id)
        end
        
        def connection
          Chitchat::Client.connection
        end
      end

      def initialize(id)
        @identifier = id
        self
      end

      def sign_on
        connection.put("/users/#{identifier}/sign_on.json")
        true
      end

      def sign_off
        connection.put("/users/#{identifier}/sign_off.json")
        true
      end

      def available?
        response = connection.get("/users/#{identifier}.json")
        
        data = JSON.parse(response.body)
        data['user']['available']
      end
      
      protected
      
      def connection
        self.class.connection
      end

    end
  end
end
