module SkipDatabase
  class Runner < Test::Unit::AutoRunner
    class << self
      attr_accessor :skipping_database
      
      # run the test suite, disconnecting the database and requiring any files in test/skip_database if skip-database option set
      def run(force_standalone=false, default_dir=nil, argv=ARGV, &block)
        if self.skipping_database == true
          require "unit_record"
          ActiveRecord::Base.disconnect! :stub_associations => true, :strategy => :raise
          dir = Rails.root.join("test/skip_database")
          Dir["#{dir}/*"].each { |file| require "#{dir}/#{File.basename(file, File.extname(file))}" }
        end
        r = new(force_standalone || standalone?, &block)
        r.base = default_dir
        # adding this option here so that it will show up on the help menu
        r.options.on("-s", "--skip-database", "Raise an exception when database calls are executed") {}
        r.process_args(argv)
        r.run
      end
    end  
  end
end
