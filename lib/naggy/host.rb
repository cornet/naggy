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

    def oks
      services.select {|service| service.ok?}
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

    def duration
      Time.now - Time.at(@state['last_state_change'].to_i)
    end

    def human_duration
      ChronicDuration.output duration.to_i, :format => :short
    end
  end
end
