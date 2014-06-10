module Naggy
  class Service
    attr_reader :name
    attr_reader :state

    def initialize(args = {})
      @name = args[:name]
      @state = args[:state]
    end

    def ok?
      @state['current_state'] == OK
    end

    def warning?
      @state['current_state'] == WARNING
    end

    def critical?
      @state['current_state'] == CRITICAL
    end

    def unknown?
      @state['current_state'] == UNKNOWN
    end

    def acked?
      @state['problem_has_been_acknowledged'] == YES
    end

    def output
      @state['plugin_output']
    end

    def duration
      Time.now - Time.at(@state['last_state_change'].to_i)
    end

    def human_duration
      ChronicDuration.output duration.to_i, :format => :short
    end
  end
end
