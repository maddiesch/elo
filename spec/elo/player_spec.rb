require 'spec_helper'

describe Elo::Player do
  let(:player1) { Elo::Player.new(2400) }
  let(:player2) { Elo::Player.new(2000) }

  describe 'rating' do
    it 'calculates 2400' do
      expect(player1.rating).to eq 1000000
    end

    it 'calculates 2000' do
      expect(player2.rating).to eq 100000
    end
  end
end
