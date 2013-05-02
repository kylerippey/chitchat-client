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
          Chitchat::Client.new(chat[:chat_id], chat[:status], chat[:messages])
        end

        # POST /chats?from=[my_user_id]&to=[their_user_id]
        def create(from_user_id, to_user_id)
          response = Chitchat::Client.connection.post("/chats.json", {:from => from_user_id, :to => to_user_id})
        end
      end

      def initialize(chat_id, status, messages=[])
        @chat_id = chat_id
        @status = status
        @messages = messages
        self
      end

      # PUT /chats/:id/answer
      def answer
      end

      # PUT /chats/:id/hang_up
      def hang_up
      end

      # POST /calls/:id/messages?from=[user_id]&body=[text]
      def send_message(from_id, body)
        response = Chitchat::Client.connection.post("/calls/#{chat_id}", {:from => from_id, :body => body})
      end

      private

      def 
    end
  end
end
