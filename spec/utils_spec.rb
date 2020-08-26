require_relative '../lib/utils.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

describe Utils do
  include Utils
  let(:game) { Game.new }
  let(:board) { Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:result) { validate_selection(4, [1, 'X', 3, 'O', 5, 'X', 7, 8, 9]) }

  describe '#validate_name' do
    let(:error1) { 'The length of the input should be between 3-16 letters' }
    let(:error2) { 'Only String type accepted for the input' }
    let(:error3) { 'Only alphabet letters accepted (no numbers or special characters)' }

    it 'allows game class to have validate_name method with argument' do
      allow(game).to receive(:validate_name).with('Remo').and_return('Remo')
    end

    context 'with invalid input' do
      it 'checks if name length less than 3' do
        expect(validate_name('ss')).to eq(error1)
      end

      it 'checks if name input is a number' do
        expect(validate_name(22)).to eq(error2)
      end

      it 'checks if name input strings is consists of numbers' do
        expect(validate_name('2224444')).to eq(error3)
      end
    end
  end
end
