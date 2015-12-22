module ELO
  class Match
    attr_reader :player_one, :player_two

    attr_accessor :player_one_score, :player_two_score

    WIN  = 1.0
    DRAW = 0.5
    LOSS = 0.0

    def initialize(player_one:, player_two:)
      @player_one = player_one
      @player_two = player_two
    end

    def expected_score_player_one
      player_one.rating / (player_one.rating + player_two.rating)
    end

    def expected_score_player_two
      player_two.rating / (player_one.rating + player_two.rating)
    end

    def update_scores
      p1_s = player_one.score + k_factor * (player_one_score - expected_score_player_one)
      p2_s = player_two.score + k_factor * (player_two_score - expected_score_player_two)

      player_one.instance_variable_set('@score', p1_s.round.to_i)
      player_two.instance_variable_set('@score', p2_s.round.to_i)
    end

    private
      def k_factor
        ELO.configuration.k_factor
      end


  end
end
