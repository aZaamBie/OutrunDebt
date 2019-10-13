extends Node

var current_player
var current_player_num
onready var path = get_node("/root/Board/City/Path")

func _ready():
	current_player = path.get_node("Player1")
	current_player_num = 1

func _process(delta):
	if current_player.offset == current_player.target_offset:
		current_player.get_node("Camera").set_current(false)
		current_player_num += 1
		if current_player_num > 4:
			current_player_num = 1
		current_player = path.get_node("Player" + str(current_player_num))
		
		var steps = randi() % 6 + 1
		var index = BoardPlaces.boardplaces.find(current_player.offset) + steps
		current_player.target_offset = BoardPlaces.boardplaces[index]
		current_player.get_node("Camera").set_current(true)
