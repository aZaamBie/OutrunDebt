extends KinematicBody

# Controls player movement

# TODO Change target_place from boolean to a node path pointing to the target board place
var is_moving = false
onready var player_follow = get_node("../")

func _process(delta):
	if is_moving:
		player_follow.set_offset(player_follow.offset + 1 * delta)
		print("player path offset: ", player_follow.get_offset())

func _input(event):
	if event is InputEventMouseButton:
		is_moving = !is_moving