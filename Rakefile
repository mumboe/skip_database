require "rubygems"
require "rake"
require "echoe"

Echoe.new("skip_database", "0.1.0") do |p|
  p.description   = "Database skipping unility for Test::Unit and ActiveSupport::TestCase"
  p.author        = "Mike Bradford"
  p.email         = "mbradford@mumboe.com"
  p.url           = "http://development.mumboe.com/"
  p.development_dependencies = ["rails","active_record","active_support","unit_record"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }