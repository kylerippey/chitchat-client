module Chitchat
  module Client
    class Chat
      attr_accessor :chat_id

      class << self
        # GET /chats/:id
        def find(id)
          response = Chitchat::Client.connection.get("/chats/#{id}.json")
          return nil unless response.status == 200 && response.headers['content-type'] == "application/json" && response.body[:chat]

          Chitchat::Client.new(id)
        end

        # POST /chats?from=[my_user_id]&to=[their_user_id]
        def create(from_user_id, to_user_id)
          response = Chitchat::Client.connection.post("/chats.json", {:from => from_user_id, :to => to_user_id})

          chat = response.body[:chat]
          Chitchat::Client.new(chat[:chat_id])
        end
      end

      def initialize(chat_id)
        @chat_id = chat_id
        self
      end

      # GET /chats/:id
      def status
        response = Chitchat::Client.connection.get("/chats/#{chat_id}.json")
        chat = response.body[:chat]
        chat[:status]
      end

      # GET /chats/:id
      def messages
        response = Chitchat::Client.connection.get("/chats/#{chat_id}.json")
        chat = response.body[:chat]
        chat[:messages]
      end

      # PUT /chats/:id/answer
      def answer
        response = Chitchat::Client.connection.put("/chats/#{chat_id}/answer.json")
        response.status == 200
      end

      # PUT /chats/:id/hang_up
      def hang_up
        response = Chitchat::Client.connection.put("/chats/#{chat_id}/hang_up.json")
        response.status == 200
      end

      # POST /calls/:id/messages?from=[user_id]&body=[text]
      def send_message(from_id, body)
        response = Chitchat::Client.connection.post("/calls/#{chat_id}.json", {:from => from_id, :body => body})
        response.status == 200
      end
    end
  end
end
