extends PathFollow

var is_moving = true

func _process(delta):
	# Moves player along the path
	if is_moving:
		set_offset(offset + 0.1)
		print("player path offset: ", get_offset())
	else:
		yield(self, "move_ready")

func _input(event):
	if event is InputEventMouseButton:
		is_moving = !is_moving

func _ready():
	set_offset(offset + 0.1)