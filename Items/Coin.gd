extends Node2D

var taken = false

func _ready():
	$AnimatedSprite.play("spin")

func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		$AnimationPlayer.play("Die")
		$AudioStreamPlayer.play()
		get_tree().call_group("Gamestate", "Coin_Up")

func Die():
	queue_free()