require_relative "restfulable"
require "faraday"
require 'faraday_middleware'

module EventLog
  class Client
    include EventLog::Restfulable
    
    EVENT_LOG_URL = "http://events.fishtrip.cn"
    
    # Access token
    attr_accessor :token
    
    # The event-logs Server host
    # @example
    # http://events.fishtrip.cn
    attr_accessor :host
    
    # @param [Hash] opts the options to create EventLog Client.
    # @option opts [String] :host <optional>
    # @option opts [String] :token <required> Access token
    # @option opts [String] :version <optional> The API version
    def initialize(opts={})
      self.host = opts.delete(:host) || EVENT_LOG_URL
      self.token = opts.delete :token
      version = opts.delete(:version) || 'v1'
      
      url = host << "/api/#{version}/"
      
      @conn ||= Faraday.new(:url => url) do |faraday|
        faraday.headers['Content-Type'] = 'application/json'
        faraday.response :json
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
    
    def default_params
      { token: token }
    end

    restful_api "event_log"

  end
end