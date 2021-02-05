module Players
    class Human < Player
        def move(board)
            puts "Enter your selection:"
            gets.strip            
        end
    end
end