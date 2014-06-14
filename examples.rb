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
