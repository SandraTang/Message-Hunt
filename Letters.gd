extends Area2D

var num = 0
var letters = 0

func _ready():
	if Global.letters_left.size() != 0:
		$AnimatedSprite.play(Global.letters_left[0])

func _process(delta):
	position += Vector2(0, delta*10*cos(num))
	num += 0.05
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			Global.letter_got = true
			queue_free()
