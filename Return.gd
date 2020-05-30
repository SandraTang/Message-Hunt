extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			Global.message = ''
			Global.letters_left = []
			Global.collected_letters = 0
			Global.current_scene
			Global.letter_got = false
			Global.goto_scene("World.tscn")
