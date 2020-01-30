extends Area2D

func _ready():
	$AnimationPlayer.play("idle")

func _on_JumpPad_body_entered(body):
	if body.has_method("Boost"):
			$AnimationPlayer.play("Boost")
			body.Boost()
 
