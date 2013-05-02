module Chitchat
  module Client
    # PUT /chats/:id/answer
    def answer
    end

    # PUT /chats/:id/hang_up
    def hang_up
    end

    # POST /calls/:id/messages?from=[user_id]&body=[text]
    def send_message(from_id, body)
    end

    # GET /chats/:id
    def find_chat(id)
    end
  end
end
