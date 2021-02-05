class Board
    attr_accessor :cells

    def initialize(cells = nil)
        @cells = cells || Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end
  
    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def position(index)
        @cells[index.to_i - 1]
    end

    def taken?(index)
        cell = position(index)
        return cell_taken?(cell)
    end

    def cell_taken?(cell)
        return !(cell.nil? || cell == " ")
    end

    def full?
        @cells.each do |cell|
          if !cell_taken?(cell)
            return false
          end
        end
        return true
    end

    def turn_count
        @cells.count{|cell| cell_taken?(cell)}
    end

    def valid_move?(index)        
        index.to_i.between?(1,9) && !taken?(index)
    end

    def update(index, player)
        if valid_move?(index)
            @cells[index.to_i - 1] = player.token
        end
    end
end