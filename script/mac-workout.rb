#!/usr/bin/env ruby 

require 'rubygems'
require 'yaml'
require 'thread'
require 'active_support'
require './lib/mac.rb'
workout = ARGV[0]
segments = ARGV[1].to_i

segments = 10 if segments == 0

i =  Workouter.new(workout, segments)
i.run


