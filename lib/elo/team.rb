module Elo
  class Team
    attr_reader :players, :score

    def initialize(*args)
      @players ||= []
      args.each { |a| @players << a }
      @score = (@players.map(&:score).inject { |sum, el| sum + el }.to_f / @players.size).round.to_i
      @og_score = @score

      @_backing = Elo::Player.new(@score)
    end

    def rating
      @_backing.rating
    end

    def update_players
      change = @score.to_f / @og_score.to_f
      @players.each do |player|
        value = (player.score * change).round.to_i
        player.instance_variable_set('@score', value)
      end
    end
  end
end
