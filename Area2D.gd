extends Area2D

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Enemy":
			print(body)
			position = Vector2(48, 48)
