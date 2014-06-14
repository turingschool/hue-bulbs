require_relative 'setup'

# http://developers.meethue.com/1_lightsapi.html
client = Hue::Client.new

eval(File.read(File.expand_path '../lights.rb',  __FILE__), binding)
eval(File.read(File.expand_path '../colours.rb', __FILE__), binding)

# initialization
Object.send :define_method, :reload do
  lights.each &on
  lights.each &color
  lights.each &red
  lights.each &dim # prob bright on prod day
end
reload # reset is taken by pry

require "pry"
binding.pry
