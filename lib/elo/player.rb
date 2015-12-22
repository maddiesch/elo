module ELO
  class Player
    attr_reader :score

    def initialize(score)
      @score = score
    end

    def rating
      (10 ** (score / 400)).to_f
    end

    # Expected score if self wins against player
    def expected_score(player)
      rating / (rating + player.rating)
    end

  end
end
