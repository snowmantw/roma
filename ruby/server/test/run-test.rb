#!/usr/bin/env ruby

ENV['BUNDLE_GEMFILE'] =
  File.expand_path(File.join(File.dirname(__FILE__),
                             '..', '..', '..', 'Gemfile'))
require 'bundler/setup'
require 'test/unit'
require 'pathname'

base_path = Pathname(__FILE__).dirname.parent.parent.expand_path
$LOAD_PATH.unshift("#{base_path}/server/lib")
$LOAD_PATH.unshift("#{base_path}/server/test")

require 'roma-test-utils'

Dir["#{base_path}/server/test/t_*.rb"].each do |test_file|
  require File.basename(test_file, '*.rb')
end

exit(Test::Unit::AutoRunner.run)
