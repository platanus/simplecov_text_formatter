require 'simplecov'
require 'coveralls'

formatters = [SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter]
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter::new(formatters)

SimpleCov.start do
  add_filter { |src| src.filename !~ /lib/ }
  add_filter "spec.rb"
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "simplecov_text_formatter"
require "pry"

path = [File.dirname(__FILE__), "support", "**", "*.rb"]
Dir[File.join(path)].sort.each { |f| require f }

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
