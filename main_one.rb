require_relative 'board.rb'
require_relative 'player.rb'

puts "WELCOME TO TIC-TAC-TOE game"
#make a board of size as size
print "Enter the size of the BOARD (n..which will be nxn) : "
size = gets.chomp.to_i
Playing_Board = Board.new size

#create two players with two different characters
print "Enter the Symbol for Player 1 : "
player_1_symbol = gets.chomp.to_s
Player_1 = Board_players.new player_1_symbol

print "Enter the Symbol for Player 2 : "
player_2_symbol = gets.chomp.to_s
Player_2 = Board_players.new player_2_symbol

#START PLAYING
turn = 1
while true
	
	Playing_Board.display()
	print " enter X cordinate : "
	x_pos = gets.chomp.to_i
	print " enter Y cordinate :  "
	y_pos = gets.chomp.to_i
	value = eval( "Player_"+turn.to_s+".getSymbol" )
	done = Playing_Board.entry(x_pos,y_pos,value)
	if( !done )
		next	
	end
	isWinner = Playing_Board.CheckWin
	if( isWinner )
		puts "HUREYY!! "+value+" WINS THE GAME "
		break
	end
	if( Playing_Board.isFull )
		puts "MATCH DRAW"
		break
	end
	if turn == 1
		turn = 2
	elsif turn == 2
		turn = 1
	end
	puts "player" + turn.to_s + " turn"
end






















