extends LineEdit

func _ready():
	set_placeholder("Paste in your code and hit enter.")

func _on_LineEdit_text_entered(new_text):
	if new_text.is_valid_integer():
		set_placeholder("Code recieved. You may begin playing.")
		self.clear()
	else:
		set_placeholder("Paste in a valid code and hit enter.")
		self.clear()
