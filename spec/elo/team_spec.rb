require 'spec_helper'

describe Elo::Team do
  let(:player1) { Elo::Player.new(1300) }
  let(:player2) { Elo::Player.new(2800) }
  let(:player3) { Elo::Player.new(1700) }
  let(:player4) { Elo::Player.new(3000) }

  let(:team1) { Elo::Team.new(player1, player2) }
  let(:team2) { Elo::Team.new(player3, player4) }

  let(:match) { Elo::Match.new(player_one: team1, player_two: team2) }

  describe 'expected rating' do
    it 'player one' do
      expect(match.expected_score_player_one.round(2)).to eq 0.15
    end
    it 'player two' do
      expect(match.expected_score_player_two.round(2)).to eq 0.85
    end
  end

  describe 'team one wins' do
    before do
      match.player_one_score = Elo::Match::WIN
      match.player_two_score = Elo::Match::LOSS
      match.update_scores
      team1.update_players
      team2.update_players
    end

    it 't1 is updated' do
      expect(team1.score).to eq 2077
    end

    it 't2 is updated' do
      expect(team2.score).to eq 2323
    end

    it 'p1 is updated' do
      expect(player1.score).to eq 1317
    end

    it 'p2 is updated' do
      expect(player2.score).to eq 2837
    end

    it 'p3 is updated' do
      expect(player3.score).to eq 1680
    end

    it 'p4 is updated' do
      expect(player4.score).to eq 2966
    end

    it 'has moved points' do 
      expect(player1.score + player2.score + player3.score + player4.score).to eq 8800
    end
  end
end
