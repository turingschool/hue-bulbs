JSL Hue Table
-------------

* Clone the repo
* `bundle install`
* `ruby pry-with-env.rb`
* run some of the code in examples.rb


#### Adding Lights to the Bridge

* Plugin the Hue Bridge to a power outlet and and an internet connection with
the ethernet cable
* Download the Philips Hue app on your iPhone
* Open the app, and select the Hue Bridge
* Click the settings gear
* Select light setup
* Click the plus sign in the bottom right corner to add a light
* Select the lights that show up in the search (make sure lights are plugged in)
* Rename lights as needed, making sure that `Turing` is in the name (If you view
lights.rb, you will notice that we are selecting lights that have `Turing` in
the name)

#### Update the lights within our code

* Open up lights.rb
* Add the appropriate number to line 5

#### How to determine name of the lights

* `ruby pry-with-env.rb`
* typing in `lights` will give you an array of the name of the lights
* reference lights.rb:5
