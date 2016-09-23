lights = client.lights
               .select  { |l| l.name =~ /Turing/ }
               .sort_by { |l| l.name[/\d+/].to_i }

l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13 = lights

# this was used for the table that we no longer have
top    = [l2, l1, l7, l8]
bottom = [l3, l4, l5, l6]
left   = [l5, l6, l7, l8, l9]
right  = [l1, l2, l3, l4, l10]
middle = [l9, l10]
ring   = lights - middle
evens  = [l2, l4, l6, l8, l10]
odds   = lights - evens

# for the, you guessed it, bloom lights
blooms = [l2, l3, l5]
