class Board
	
	def initialize length
		@Size = '0'.to_i
		@N = length
		@Board_layout = Array.new(length) { Array.new(length) } # empty 2-D array with all entries nil
	end

	def entry x_pos , y_pos , value 
		#puts "IN HERE"
		if( x_pos >= @N || y_pos>=@N || x_pos<0 || y_pos<0 )
			puts "invalid entry"
			return false
		end
		if( @Board_layout[x_pos][y_pos] != nil )
			puts "already occupied"
			return false
		end
		@Size = @Size + 1
		@Board_layout[x_pos][y_pos]=value
		return true
	end

	def isFull
		if (@Size >= @N*@N)
			return true
		end
		return false
	end

	def CheckWin
		#CHECKING POSSIBILITY FOR A HORIZONTAL COVERAGE
		for i in 0...@N
			value = @Board_layout[i][0]
			isWinner = true 
			for j in 0...@N
				if @Board_layout[i][j] != value
					isWinner = false
					break
				end 	
			end
			if isWinner
				return value   
			end
		end
		#CHECKING THE POSSIBILITY FOR A VERTICAL COVERAGE
		for i in 0...@N
			value = @Board_layout[0][i]
			isWinner = true 
			for j in 0...@N
				if @Board_layout[j][i] != value
					isWinner = false
					break
				end 	
			end
			if isWinner
				return value
			end
		end
		#CHECKING FOR DIAGONAL FROM LEFT TO RIGHT
		i=0
		j=0
		value = @Board_layout[0][0]
		isWinner = true 
		while j<@N && i<@N
			if value != @Board_layout[i][j] 
				isWinner = false
				break
			end
			i = i+1
			j = j+1
		end		
		if( isWinner )
			return value
		end
		
		#CHECKING FOR DIAGONAL FROM RIGHT TO LEFT
		i=0
		j=@N-1
		value = @Board_layout[@N-1][@N-1]
		isWinner = true 
		while j>=0 && i<@N
			if value != @Board_layout[i][j] 
				isWinner = false
				break
			end
			i = i+1
			j = j-1
		end		
		if( isWinner )
			return value
		end
	return false
	end

	#FUNCTION FOR DISPLAYING THE BOARD
	def display
		system("clear")
		for i in 0...@N
			for j in 0...@N
				print "\t|" , @Board_layout[i][j] , "|"
			end
			puts " " 
		end
	end
end
	
