extends Area2D




func _on_Spiketop_body_entered(body):
	if body.has_method("hurt"):
		get_tree().call_group("Gamestate", "hurt")

