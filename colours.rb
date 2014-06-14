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
