require 'nagios'
require 'naggy/client'
require 'naggy/version'
require 'naggy/host'
require 'naggy/hosts'
require 'naggy/service'

module Naggy
  # Host States
  UP = '0'

  # Service States
  OK = '0'
  WARNING = '1'
  CRITICAL = '2'
  UNKNOWN = '3'

  # Other States
  NO = '0'
  YES = '1'
end
