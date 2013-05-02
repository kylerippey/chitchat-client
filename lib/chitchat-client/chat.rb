module Chitchat
  module Client
    class Chat
      attr_accessor :chat_id
      attr_accessor :status
      attr_accessor :messages

      class << self
        # GET /chats/:id
        def find(id)
          response = Chitchat::Client.connection.get("/chats/#{id}.json")
          return nil unless response.status == 200 && response.headers['content-type'] == "application/json" && response[:chat]

          chat = response[:chat]
          status = chat[:status]
          messages = chat[:messages]
        end
      end

      def initialize
      end

      # PUT /chats/:id/answer
      def answer
      end

      # PUT /chats/:id/hang_up
      def hang_up
      end

      # POST /calls/:id/messages?from=[user_id]&body=[text]
      def send_message(from_id, body)
      end
    end
  end
end
