module Chitchat
  module Client
    class Message

      attr_accessor :from, :body

      def initialize(attrs)
        @from = attrs['user']
        @body = attrs['body']
      end

    end
  end
end
