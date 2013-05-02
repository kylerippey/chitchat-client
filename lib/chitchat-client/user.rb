module Chitchat
  module Client

    # PUT /users/:id/sign_on
    def sign_on(id)
      response = self.connection.put("/users/#{id}/sign_on")
      response.status == 200
    end

    # PUT /users/:id/sign_off
    def sign_off(id)
      response = self.connection.put("/users/#{id}/sign_off")
      response.status == 200
    end

    # GET /users/:id
    def available?(id)
      response = connection.get("/users/#{id}")
      return false unless response.status == 200 && response.headers['content-type'] == "application/json"

      user = response.body[:user]
      user ? user[:status] == "available" : false
    end

    # GET /users/:id/chats?status=pending
    def pending_chats(id)
      connection.get("/users/#{id}/chats", {:status => 'pending'})
    end
  end
end
