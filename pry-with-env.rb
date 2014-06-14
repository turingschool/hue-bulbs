require_relative 'setup'

# http://developers.meethue.com/1_lightsapi.html
client = Hue::Client.new

b = binding
eval(File.read(File.expand_path '../lights.rb',  __FILE__), b)
eval(File.read(File.expand_path '../colours.rb', __FILE__), b)

# # initialization
# Object.send :define_method, :reload do
b.eval '
  lights.each &on
  lights.each &color
  lights.each &red
  lights.each &bright
'
# end
# reload # reset is taken by pry

require "pry"
b.pry
