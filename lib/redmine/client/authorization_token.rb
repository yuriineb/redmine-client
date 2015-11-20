module Redmine
  class Client
    class AuthorizationToken < Faraday::Middleware
      AUTH_HEADER = "X-Redmine-API-Key".freeze unless defined? MIME_TYPE

      def initialize(app, token)
        @access_token = token
        super(app)
      end

      def call(env)
        env.request_headers[AUTH_HEADER] = @access_token

        @app.call(env)
      end
    end
  end
end

Faraday::Request::AuthorizationToken = Redmine::Client::AuthorizationToken
Faraday::Request.register_middleware(:authorization_token => lambda { Faraday::Request::AuthorizationToken })
