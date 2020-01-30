extends Control



func _on_quit_pressed():
	get_tree().quit()


func _on_retry_pressed():
	get_tree().change_scene("res://levels/level1.tscn")
