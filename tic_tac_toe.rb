#!/bin/ruby

# https://www.hackerrank.com/challenges/tic-tac-toe

class TicTacToe
  #TODO: Generate this you idiot
  SOLUTIONS = [
    [[0, 0], [0, 1], [0, 2]],
    [[1, 0], [1, 1], [1, 2]],
    [[2, 0], [2, 1], [2, 2]],

    [[0, 0], [1, 0], [2, 0]],
    [[0, 1], [1, 1], [2, 1]],
    [[0, 2], [1, 2], [2, 2]],

    [[0, 0], [1, 1], [2, 2]],
    [[2, 2], [1, 1], [0, 0]],
  ]

  def initialize(player, board)
    @board = board
    @player = player
    if player == 'X'
      @opponent = 'O'
    else
      @opponent = 'X'
    end
  end

  def get(row, col)
    @board[row][col]
  end

  def is_solution?(solution)
    solution.all? {|cell| get(*cell) != @opponent }
  end

  def can_move?(move)
    get(*move) == '_'
  end

  def possible_solutions
    SOLUTIONS.shuffle.select(&method(:is_solution?))
  end

  def available_moves
    possible_solutions.reduce(:|).select(&method(:can_move?))
  end

  def next_move
    available_moves.first
  end
end

player = gets.chomp
board = Array.new(3) { gets.scan(/\w/) }
game = TicTacToe.new(player, board)
puts game.next_move.join(' ')
