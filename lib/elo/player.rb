module Elo
  class Player
    attr_reader :score

    def initialize(score)
      @score = score
    end

    def rating
      10.0 ** (score.to_f / 400.0)
    end

  end
end
