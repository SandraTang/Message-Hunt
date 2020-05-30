extends Area2D

var worlds = ["One.tscn", "Two.tscn", "Three.tscn", "Four.tscn", "Five.tscn", "Six.tscn", "Seven.tscn", "Eight.tscn", "Nine.tscn", "Ten.tscn", "Eleven.tscn", "Twelve.tscn", "Thirteen.tscn", "Fourteen.tscn", "Fifteen.tscn"]
var next_world
const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ '

func _ready():
	randomize()

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			if Global.letter_got:
				Global.collected_letters += 1
				Global.letters_left.remove(0)
			Global.letter_got = false
			if Global.letters_left.size() == 0:
				Global.goto_scene("Done.tscn")
			else:
				var now = get_tree().get_current_scene().get_name()
				now = str(now) + '.tscn'
				next_world = worlds[randi() % worlds.size()]
				while next_world == now:
					next_world = worlds[randi() % worlds.size()]
				Global.goto_scene(next_world)
				worlds.remove(next_world)
				if worlds.size() == 0:
					worlds = ["One.tscn", "Two.tscn", "Three.tscn", "Four.tscn", "Five.tscn", "Six.tscn", "Seven.tscn", "Eight.tscn", "Nine.tscn", "Ten.tscn", "Eleven.tscn", "Twelve.tscn", "Thirteen.tscn", "Fourteen.tscn", "Fifteen.tscn"]

func _on_LineEdit_text_entered(new_text):
	if new_text.is_valid_integer():
		Global.letters_left = []
		Global.message = ''
		var a = int(new_text[0])
		var b = int(new_text[1])
		for i in range((new_text.length()-2)/2):
			var encoded_letter = int(new_text[i*2+2] + new_text[i*2+3])
			var num_letter = (encoded_letter/b)-a
			Global.letters_left.append(ALPHABET[num_letter])
			Global.message += ALPHABET[num_letter]
#		var translated = []
#		for i in range((new_text.length()-2)/4):
#			translated.append(0)
#		for i in range((new_text.length()-2)/4):
#			var encoded_letter = int(new_text[i*4+2] + new_text[i*4+3])
#			var num_letter = (encoded_letter/b)-a
#			var pos_letter = int(new_text[i*4+4] + new_text[i*4+5])
#			translated[pos_letter] = ALPHABET[num_letter]
#			if ALPHABET[num_letter] != ' ':
#				Global.letters_left.append(ALPHABET[num_letter])
#		var text = ''
#		for element in translated:
#			text += element
#		Global.message = text
		print(Global.message)
		print(Global.letters_left)
