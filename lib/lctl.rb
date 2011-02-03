require 'bundler/setup'

module Lctl
end

$:.push File.expand_path("../lib", __FILE__)

require 'lctl/version'
require 'lctl/finder'
require 'lctl/cli'
