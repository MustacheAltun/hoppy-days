extends CanvasLayer


func update_GUI(Lives_left, Coins):
	$Control/TextureRect/HBoxContainer/LifeCounter.text = str(Lives_left)
	$Control/TextureRect/HBoxContainer/CoinCounter.text = str(Coins)
