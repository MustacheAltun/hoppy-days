extends KinematicBody2D

var motion = Vector2(0,0)
var speed = 1500
var jump_speed = 5000

signal animate

const GRAVITY = 100
const MAX_GRAVITY= 2000
const UP =Vector2(0,-1)
const WOLRD_LIMIT = 4000
const BOOST_MULTIPLIER = 1.5

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)
	
func apply_gravity():
	if position.y > WOLRD_LIMIT:
		get_tree().call_group("Gamestate","end_game")
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY
		
func jump():
	if is_on_floor():
		if Input.is_action_pressed("Jump"):
			motion.y = -jump_speed
			$Camera2D/JumpSFX.play()
	else:
		motion.y += GRAVITY

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -speed
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = speed
	else:
		motion.x = 0

func animate():
	emit_signal("animate", motion)
	

func hurt():
	position.y -= 1 
	yield (get_tree(),"idle_frame")
	motion.y = -jump_speed
	$Camera2D/PainSFX.play()

func Boost():
	position.y -= 1
	yield (get_tree(),"idle_frame")
	motion.y = -(jump_speed * BOOST_MULTIPLIER)
