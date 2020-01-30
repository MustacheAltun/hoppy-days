extends Node2D

var Lives = 3
var Coins = 0
var target_number_of_coins = 10

func _ready():
	add_to_group("Gamestate")
	update_GUI()

func hurt():
	Lives -= 1
	$Player.hurt()
	update_GUI()
	if Lives < 0:
		end_game()

func update_GUI():
	get_tree().call_group("GUI", "update_GUI", Lives, Coins)
	
func Coin_Up():
	Coins += 1
	update_GUI()
	var multiple_of_coins = (Coins % target_number_of_coins) == 0
	if multiple_of_coins:
		life_up()

func life_up():
	Lives += 1
	update_GUI()

func end_game():
	get_tree().change_scene("res://levels/GameOver.tscn")
	
func win_game():
	get_tree().change_scene("res://levels/Victory.tscn")