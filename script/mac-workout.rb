#!/usr/bin/env ruby 

require 'bundler/setup'
require 'yaml'
require 'thread'
require 'active_support'
require './lib/mac.rb'
workout = ARGV[0]
segments = ARGV[1].to_i

if workout.nil?
   puts "You must specify a workout\ntry: #{$0} hard"
   exit 1
end

segments = 10 if segments == 0

i =  Workouter.new(workout, segments)
i.run


