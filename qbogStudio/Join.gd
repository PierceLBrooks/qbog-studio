extends Button


var state: bool = false


func _ready():
	pressed.connect(_button_pressed)
	get_parent().get_parent().find_child("CenterContainerRight").find_child("TextEdit").hide()


func _button_pressed():
	state = not state
	if (state):
		get_parent().get_parent().find_child("CenterContainerRight").find_child("Button").queue_free()
		get_parent().get_parent().find_child("CenterContainerRight").find_child("TextEdit").show()
		get_parent().get_parent().find_child("CenterContainerRight").find_child("CenterContainer").queue_free()
	else:
		get_parent().get_parent().queue_free()

