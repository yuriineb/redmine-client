require 'redmine/client/version'
require 'faraday'

module Redmine
  module Client
    def initialize(access_key)
      @access_key = access_key
    end
  end
end
