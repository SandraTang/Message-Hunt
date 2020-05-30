extends Area2D

export(bool) var horiz
export(int) var start
export(int) var stop

const SPEED = 80
var dir = 1

func _process(delta):
	if horiz:
		position += Vector2(SPEED*dir*delta, 0)
		if position.x > stop:
			dir = -1
		if position.x < start:
			dir = 1
	else:
		position += Vector2(0, SPEED*dir*delta)
		if position.y > stop:
			dir = -1
		if position.y < start:
			dir = 1
	# if touching player
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().reload_current_scene()
			Global.letter_got = false
