extends PathFollow

var is_moving = false

func _process(delta):
	if is_moving:
		set_offset(offset + 0.1)
		print("player path offset: ", get_offset())

func _input(event):
	if event is InputEventMouseButton:
		is_moving = !is_moving