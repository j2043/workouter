#!/usr/bin/env ruby 

require 'yaml'
require 'activesupport'

workout = YAML::load_file("config/workouts/basic.yml")
intervals = 10

def do_segment(activity, interval=30)
  puts activity
  sleep interval - 10
  puts "10 seconds"
  sleep 8 
end

do_segment("get ready", 10)
intervals.times do |count|
  puts "#{ intervals - count} left"
  do_segment(workout["slow"].random_element)
  do_segment(workout["fast"].random_element)
  do_segment(workout["slow"].random_element)
  do_segment(workout["fast"].random_element)
  do_segment("rest")
end



