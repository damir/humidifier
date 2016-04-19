module Humidifier

  # Represents a CFN stack mapping
  class Mapping

    attr_accessor :opts

    def initialize(opts = {})
      self.opts = opts
    end

    def to_cf
      Serializer.dump(opts)
    end
  end
end
