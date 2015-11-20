require 'json'

module Faraday
  class Response
    class JSONEncoded < Response::Middleware
      CONTENT_TYPE = 'Content-Type'.freeze unless defined? CONTENT_TYPE
      MIME_TYPE    = "application/json".freeze unless defined? MIME_TYPE

      def call(env)
        unless env.body.respond_to?(:to_str)
          env.request_headers[CONTENT_TYPE] = MIME_TYPE
          env.body = env.body.to_json
        end

        super
      end

      def on_complete(env)
        if env.body.respond_to?(:to_str)
          env.body = JSON.parse(env.body)
        end
      end
    end
  end
end

Faraday::Response.register_middleware(File.dirname(__FILE__), {
  :json_encoded => [:JSONEncoded, 'json_encoded']
})
