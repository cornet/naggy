module Naggy
  class Nagios
    attr_reader :state
    attr_reader :clients

    def initialize(args = {})
      @state = {}
      @clients = []

      args[:hosts].each do |k,v|
        @clients << ::Nagios::API::Client.new(v)
      end

      refresh_state!
    end
    
    def refresh_state!
      @state.clear
      @clients.each {|client| @state.merge! client.state.data}
    end

    def hosts
      @hosts ||= Naggy::Hosts.new(:api_client => self)
    end
  end
end
