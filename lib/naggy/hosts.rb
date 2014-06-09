module Naggy
  class Hosts

    def initialize(args = {})
      @api_client = args[:api_client]
    end

    def all
      @api_client.state.collect do |host, status|
        Naggy::Host.new({:name => host, :state => status})
      end
    end

    def up
      all.select {|host| host.up?}
    end

    def down
      all.select {|host| host.down?}
    end
  end
end
