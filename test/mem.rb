#!/usr/bin/env ruby
# encoding: UTF-8

$: << '.'
$: << File.join(File.dirname(__FILE__), "../lib")
$: << File.join(File.dirname(__FILE__), "../ext")

require 'oj'

Oj.default_options = { mode: :rails, cache_keys: true, cache_str: -1 }

def mem
  `ps -o rss= -p #{$$}`.to_i
end

('a'..'z').each { |a|
  ('a'..'z').each { |b|
    ('a'..'z').each { |c|
      ('a'..'z').each { |d|
	('a'..'z').each { |e|
	  key = "#{a}#{b}#{c}#{d}#{e}"
	  x = Oj.load(%|{ "#{key}": 101}|)
	  #Oj.dump(x)
	}
      }
    }
    puts "#{a}#{b} #{mem}"
  }
}

Oj::Parser.new(:usual)