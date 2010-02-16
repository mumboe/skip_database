require File.join File.dirname(__FILE__), "test/unit/unit"
require File.join File.dirname(__FILE__), "skip_database/runner"
require File.join File.dirname(__FILE__), "active_support/test_case"

OptionParser.new do |opts|
  opts.on("-s", "--skip-database") do |e|
    SkipDatabase::Runner.skipping_database = true
  end
end.parse! [ARGV.delete("-s") || ARGV.delete("--skip-database")]

at_exit { exit SkipDatabase::Runner.run unless $! || Test::Unit.run? }