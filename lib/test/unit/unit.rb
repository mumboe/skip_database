# redifining this file to remove the original at_exit block
require 'test/unit/testcase'
require 'test/unit/autorunner'

module Test # :nodoc:
  module Unit
    def self.run=(flag)
      @run = flag
    end

    def self.run?
      @run ||= false
    end
  end
end