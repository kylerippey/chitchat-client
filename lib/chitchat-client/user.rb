module Chitchat
  module Client

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

    # GET /users/:id/chats?status=pending
    def pending_chats(id)
      connection.get("/users/#{id}/chats", {:status => 'pending'})
    end
  end
end
