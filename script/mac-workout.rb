#!/usr/bin/env ruby 

require 'yaml'
require 'activesupport'
require './lib/mac.rb'
workout = ARGV[0]
i =  Workouter.new(workout)
i.run


