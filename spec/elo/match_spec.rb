require 'spec_helper'

describe Elo::Match do
  let(:player1) { Elo::Player.new(2400) }
  let(:player2) { Elo::Player.new(2000) }
  let(:match) { Elo::Match.new(player_one: player1, player_two: player2) }

  describe 'expected rating' do
    it 'player one' do
      expect(match.expected_score_player_one.round(2)).to eq 0.91
    end
    it 'player two' do
      expect(match.expected_score_player_two.round(2)).to eq 0.09
    end
  end

  describe 'player one wins' do
    before do
      match.player_one_score = Elo::Match::WIN
      match.player_two_score = Elo::Match::LOSS
      match.update_scores
    end

    it 'p1 is updated' do
      expect(player1.score).to eq 2403
    end

    it 'p2 is updated' do
      expect(player2.score).to eq 1997
    end
  end

  describe 'player two wins' do
    before do
      match.player_one_score = Elo::Match::LOSS
      match.player_two_score = Elo::Match::WIN
      match.update_scores
    end

    it 'p1 is updated' do
      expect(player1.score).to eq 2371
    end

    it 'p2 is updated' do
      expect(player2.score).to eq 2029
    end
  end

  describe 'draw' do
    before do
      match.player_one_score = Elo::Match::DRAW
      match.player_two_score = Elo::Match::DRAW
      match.update_scores
    end

    # The scores still change becase p2 isn't a good at p1 but played a solid game

    it 'p1 is updated' do
      expect(player1.score).to eq 2387
    end

    it 'p2 is updated' do
      expect(player2.score).to eq 2013
    end
  end
end
