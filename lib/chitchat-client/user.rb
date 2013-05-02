module Chitchat
  module Client
    class User
      # PUT /users/:id/sign_on
      def sign_on(id)
        self.connection.put("/users/#{id}/sign_on")
      end

      # PUT /users/:id/sign_off
      def sign_off(id)
        self.connection.post("/users/#{id}/sign_off")
      end

      # GET /users/:id
      def available?(id)
        connection.get("/users/#{id}")
      end

      def pending_chats
      end
    end
  end
end
