module ActiveSupport
  class TestCase

    class << self
      # the block will be called only if database execution is skipped
      def skip_database(&block)
        block.bind(self).call if SkipDatabase::Runner.skipping_database
      end

      # the block will not be called if database execution is skipped
      def with_database(&block)
        block.bind(self).call unless SkipDatabase::Runner.skipping_database
      end
      
      def skipping_database?
        SkipDatabase::Runner.skipping_database
      end
    end

    def skipping_database?
      SkipDatabase::Runner.skipping_database
    end

    # the block will be called only if database execution is skipped
    def skip_database(&block)
      block.bind(self).call if SkipDatabase::Runner.skipping_database
    end

    # the block will not be called if database execution is skipped
    def with_database(&block)
      block.bind(self).call unless SkipDatabase::Runner.skipping_database
    end
  
  end
end
