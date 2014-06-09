module Naggy
  class Host
    attr_reader :name
    attr_reader :state

    def initialize(args = {})
      @name = args[:name]
      @state = args[:state]
    end

    def up?
      @state['current_state'] == UP
    end

    def down?
      @state['current_state'] != UP
    end

    def services
      @state['services'].collect do |service, state|
        Naggy::Service.new(:name => service, :state => state)
      end
    end

    def problems
      services.select {|service| !service.ok?}
    end

    def warnings
      services.select {|service| service.warning?}
    end

    def criticals
      services.select {|service| service.critical?}
    end

    def unknowns
      services.select {|service| service.unknown?}
    end
  end
end
