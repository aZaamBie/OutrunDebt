extends KinematicBody

# Controls player behaviour

# TODO Change target_place from boolean to a node path pointing to the target board place
var target_place = false
onready var player_follow = get_node("../")

func _process(delta):
	#if target_place:
		player_follow.set_offset(player_follow.offset + 1 * delta)
		print("player path offset: ", player_follow.get_offset())

# Function moves player board piece to the board place that was clicked
func _on_Place_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			print("Mouse clicked")
			target_place = true
		else:
			print("Mouse released")