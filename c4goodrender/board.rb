class Array
  def safe_transpose
    max_size = self.map(&:size).max
    self.dup.map{|r| r << nil while r.size < max_size; r}.transpose
  end
end



class Board
   def initialize
       @board = Array.new(7){Array.new(6, "z")}
       @counter = 0
       @column=0
       @rowcoordinate=0
   end

   def render
       puts "--------- CONNECT 4 ---------"
       puts "-----------------------------"
       @board.safe_transpose.each do |row|
           row.each do |cell|
               print "|"
               if cell == "z"
                 print("---")
               else
                 print(" #{cell.to_s} ")
               end
           end
       print "|"
       puts
       puts "-----------------------------"
       end

   end
   def add_piece(column,symbol)
       @column=column
       if column_avaliable?
          i=6
          while true
            if @board[column.to_i][i] == "z"
              @board[column.to_i][i]= symbol
               @rowcoordinate=i
              break
            else
              i-=1
              next
            end
          end
          return true
       else
           false
       end
   end

   def column_avaliable?
       if @board[@column.to_i].size <=6
           return true
       else
           return false
       end
   end
   def winning_combination?
       winning_vertical? || winning_horizontal? || winning_diagonal?
   end
   def winning_vertical?
       verticalarray=[@board[@column.to_i][5],@board[@column.to_i][4],@board[@column.to_i][3],
       @board[@column.to_i][2],@board[@column.to_i][1],@board[@column.to_i][0]]
       four_in_a_row?(verticalarray)
   end
   def four_in_a_row?(arr)
       arr.join.to_s.include?("XXXX") || arr.join.to_s.include?("OOOO")
   end
   def winning_horizontal?
      horizontalarray=[@board[0][@rowcoordinate],@board[1][@rowcoordinate],
      @board[2][@rowcoordinate],@board[3][@rowcoordinate],@board[4][@rowcoordinate],
      @board[5][@rowcoordinate], @board[6][@rowcoordinate]]
      four_in_a_row?(horizontalarray)
   end

   def winning_diagonal?
    right_to_left_diag?(@column.to_i,@rowcoordinate.to_i) || left_to_right_diag?(@column.to_i,@rowcoordinate.to_i)

   end

  def right_to_left_diag? (altcol, altrow)
   n=0
   i=0
   checkarr = []

   checkpiececolumn = altcol
   checkpiecerow = altrow

   4.times do |i|
     if altcol == -1 || altrow == -1 || altcol == 7 || altrow == 6
       break
     else
       checkarr.push @board[altcol][altrow]
       altcol -= 1 
       altrow += 1
       i += 1
     end
   end


   altcol = checkpiececolumn-1
   altrow = checkpiecerow-1

   3.times do |n|
     if altcol == -1 || altrow == -1 || altcol == 7 || altrow == 6
       break
     else 
      checkarr.unshift @board[altcol][altrow]
      altcol += 1 
      altrow -= 1
      n += 1
     end 
   end 

   if four_in_a_row?(checkarr)
      return true
    else 
      return false
    end 

    end

  def left_to_right_diag? (altcol, altrow)
    n = 0
    i = 0

    checkarr = []

    checkpiececolumn = altcol
    checkpiecerow = altrow

    4.times do |i|
      if altcol == -1 || altrow == -1 || altcol ==7 || altrow == 6
        break
      else
        checkarr.push @board[altcol][altrow]
        altcol += 1
        altrow += 1
        i += 1
      end
    end
    
    3.times do |n|
      if altcol == -1 || altrow == -1 || altcol == 7 || altrow ==6
        break  
      else
      checkarr.unshift @board[altcol][altrow]
      altcol -= 1
      altrow -= 1
      n += 1      
      end
    end 

    if four_in_a_row?(checkarr)
    	return true
    else
    	return false
    end
end
end