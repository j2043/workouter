#!/usr/bin/env ruby 

require 'yaml'
require 'activesupport'

class Workouter

  def initialize(workout_name)
    @workout = YAML::load_file("config/workouts/#{workout_name}.yml")
    @intervals = 10
    @actions = {}
  end

  def say(text)
    puts text
    system("say \"#{text}\"")
  end

  def do_segment(activity, interval=30)
    say activity
    sleep interval - 10
    say "10 seconds"
    sleep 8 
  end

  def get_action(type)
    if @actions[type] && @actions[type].length > 0
      return @actions[type].shift
    end

    @actions[type] = @workout[type.to_s].shuffle 
    get_action(type)
  end


  def run
    do_segment("get ready", 10)
    @intervals.times do |count|
      say "#{ @intervals - count} segments left"
      do_segment(get_action(:slow))
      do_segment(get_action(:fast))
      do_segment(get_action(:slow))
      do_segment(get_action(:fast))
      do_segment("rest")
    end
    say("Done!")
  end
end



