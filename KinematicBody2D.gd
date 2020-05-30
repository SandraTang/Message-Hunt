extends KinematicBody2D

const ACCELERATION = 300
const MAX_SPEED = 100
const FRICTION = 300

var velocity = Vector2.ZERO
var up = false

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = min(1, Input.get_action_strength("ui_right") + int(Input.is_action_pressed("right"))) - min(1, Input.get_action_strength("ui_left") + int(Input.is_action_pressed("left")))
	input_vector.y = min(1, Input.get_action_strength("ui_down") + int(Input.is_action_pressed("down"))) - min(1, Input.get_action_strength("ui_up") + int(Input.is_action_pressed("up")))
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector*MAX_SPEED, ACCELERATION*delta)
		if input_vector.x != 0:
			$AnimatedSprite.play("Run")
			$AnimatedSprite.flip_h = input_vector.x < 0
			up = false
		else:
			if input_vector.y > 0:
				$AnimatedSprite.play("Runvert")
				up = false
			else:
				$AnimatedSprite.play("Runvertup")
				up = true
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION*delta)
		if up:
			$AnimatedSprite.play("Idleup")
		else:
			$AnimatedSprite.play("Idle")
		
	velocity = move_and_slide(velocity)\
