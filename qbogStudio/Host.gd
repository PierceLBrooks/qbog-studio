extends Button


var open_file_dialog: FileDialog = null


func _ready():
	pressed.connect(_button_pressed)
	open_file_dialog = find_child("FileDialog")
	open_file_dialog.add_filter("*.bvh ; Biovision Hierarchy")
	open_file_dialog.file_mode = FileDialog.FileMode.FILE_MODE_OPEN_FILE
	open_file_dialog.access = FileDialog.Access.ACCESS_FILESYSTEM
	if (OS.is_debug_build()):
		open_file_dialog.current_dir = ProjectSettings.globalize_path("res://")
	else:
		open_file_dialog.current_dir = OS.get_user_data_dir()
	open_file_dialog.connect("file_selected", Callable(self, "_on_file_select"))


func _button_pressed():
	open_file_dialog.popup_centered(get_viewport_rect().size)


func _on_file_select(file: String):
	if file == null or file == "":
		printerr("File is null")
		return
	var script = get_tree().get_root().get_node("Root").find_child("BVH").get_script()
	var child = script.load_bvh_filename(file)
	print(str(child))
	if child == null:
		return
	#get_tree().get_root().get_node("Root").add_child(child)
