require_relative 'setup'

# http://developers.meethue.com/1_lightsapi.html
client = Hue::Client.new

# light groups
lights = client.lights
               .select  { |l| l.name =~ /JSL Light/ }
               .sort_by { |l| l.name[/\d+/].to_i }

l1, l2, l3, l4, l5, l6, l7, l8, l9, l10 = lights

top    = [l2, l1, l7, l8]
bottom = [l3, l4, l5, l6]
left   = [l5, l6, l7, l8, l9]
right  = [l1, l2, l3, l4, l10]
middle = [l9, l10]
ring   = lights - middle
evens  = [l2, l4, l6, l8, l10]
odds   = lights - evens

# commands
on     = -> light { light.on = true  }
off    = -> light { light.on = false }

dark   = -> light { light.brightness = 0   }
dim    = -> light { light.brightness = 125 }
bright = -> light { light.brightness = 255 }

white  = -> light { light.saturation = 0   }
color  = -> light { light.saturation = 255 }
red    = -> light { color.call(light); light.hue =      0 }
orange = -> light { color.call(light); light.hue =  7_000 }
yellow = -> light { color.call(light); light.hue = 15_000 }
green  = -> light { color.call(light); light.hue = 25_000 }
blue   = -> light { color.call(light); light.hue = 47_000 }
violet = -> light { color.call(light); light.hue = 50_000 }
pink   = -> light { color.call(light); light.hue = 55_000 }

# initialization
Object.send :define_method, :reload do
  lights.each &on
  lights.each &color
  lights.each &red
  lights.each &dim # prob bright on prod day
end
reload # reset is taken by pry

# rainbow
lights.each_with_index { |l, i| l.hue = i * 6000 }
sleep 3
reload

# fade in
lights.each_with_index { |l, i| l.brightness = i * 25 }
sleep 3
reload

# blinking
5.times { lights.each(&pink); sleep 1; lights.each(&blue); sleep 1 }

# simple christmas lights
evens.each(&green)
odds.each(&red)
sleep 3
reload

# fancy christmas lights
t1 = Thread.new { ring.each &red; loop{ring.each &on; sleep 1; ring.each &off; sleep 1 }}
t2 = Thread.new { middle.each &green; loop{middle.each &on; sleep 1; middle.each &off; sleep 1 }}
sleep 5
t1.kill
t2.kill
reload

# fancy christmas lights 2
5.times do
  evens.each &green
  odds.each &red
  sleep 1
  evens.each &red
  odds.each &green
  sleep 1
end


require "pry"
binding.pry

