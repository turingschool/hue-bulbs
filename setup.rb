require 'bundler/setup'
require 'hue'

module Hue
  class Client
    def bridges
      @bridges ||= begin
        bs = []
        MultiJson.load(Net::HTTP.get(URI.parse('https://www.meethue.com/api/nupnp'))).each do |hash|
          bs << Bridge.new(self, hash)
        end
        bs
      end
    end
  end

  class Light
    def inspect
      "#<#{self.class.name} #{name.inspect}>"
    end
  end
end
