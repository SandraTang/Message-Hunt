extends LineEdit

const A_ARRAY = [0, 1, 2, 3, 4, 5]
const B_ARRAY = [1, 2, 3]
const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ '

func _ready():
	set_placeholder("Type in a message to encrypt.")

func _on_LineEdit2_text_entered(new_text):
	var no_space = new_text.replace(' ', '')
	# check if alpha
	var regex = RegEx.new()
	regex.compile("^[A-Za-z]+$")
	var result = regex.search(no_space)
	if result == null:
		# is not alpha
		set_placeholder("Message can only have letters and spaces.")
		self.clear()
	else:
		# isalpha
		new_text = new_text.to_upper()
		# encrypt it
		var a = A_ARRAY[randi() % A_ARRAY.size()]
		var b = B_ARRAY[randi() % B_ARRAY.size()]
		var output = str(a) + str(b)
		for i in range(len(new_text)):
			var letter = new_text[i]
			var code = (ALPHABET.find(letter, 0)+a)*b
			code = str(code)
			if len(code) == 1:
				code = '0' + code
#			var pos = str(i)
#			if len(pos) == 1:
#				pos = '0' + pos
			output += str(code)
		OS.set_clipboard(output)
		set_placeholder("Message encrypted and copied to your clipboard.")
		self.clear()
