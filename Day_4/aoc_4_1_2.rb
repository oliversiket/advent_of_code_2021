class BingoDayFour
  attr_reader :numbers, :boards

  def initialize
    boards = File.read('input').split("\n" * 2)
    @numbers = File.read('numbers').split(',').map(&:to_i)
    @boards = boards.map{|board| Board.new(board)}
  end

  def first_winner_score
    numbers.each do |number|
      boards.each do |board|
        board.num(number)
        return board.score if board.winner?
      end
    end
  end

  def last_winner_score
    numbers.each do |number|
      boards.each do |board|
        board.num(number)
      end
      if boards.one? && boards.last.winner?
        return boards.last.score
      end
      boards.delete_if(&:winner?)
    end
  end

  class Board
    attr_reader :rows, :last_num
    def initialize(board)
      @rows = board.split("\n").map { |line| line.strip.split(/\s+/).map(&:to_i)}
      @last_num
    end

    def num(number)
      @last_num = number
      rows.map! do |row|
        row.map! do |val|
          number == val ? nil : val
        end
      end
    end

    def columns
      rows.transpose
    end

    def winner?
      rows.any? {|row| row.all?(&:nil?)} ||
        columns.any? {|column| column.all?(&:nil?)}
    end

    def score
      rows.flatten.compact.sum * last_num
    end
  end
end

puts BingoDayFour.new.first_winner_score
puts BingoDayFour.new.last_winner_score