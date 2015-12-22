module ELO
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end



  class Configuration
    attr_accessor :k_factor, :base_score

    def initialize
      @k_factor   = 32
      @base_score = 1000
    end
  end
end
