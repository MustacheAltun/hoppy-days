extends AnimatedSprite




func _on_Player_animate(motion):
	if motion.y < 0:
			play("jump")
	elif motion.x != 0:
		if Input.is_action_pressed("left"):
			play("walk")
			flip_h = true
		elif Input.is_action_pressed("right"):
			play("walk")
			flip_h = false
	else:
		play("idle")