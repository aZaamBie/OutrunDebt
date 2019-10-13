extends PathFollow

export var SPEED = 5
var is_moving = false
var target_offset = BoardPlaces.boardplaces[1]
onready var banker = get_node("root/Board/Banker")

func _ready():
	set_offset(BoardPlaces.boardplaces[0])
	$Finances.connect("pay_rent", banker, "_on_player_pay_rent")
	$Finances.connect("buy_property", banker, "_on_player_buy_property")

func _process(delta):
	if is_moving:
		if target_offset > offset:
			set_offset(max(offset + SPEED * delta, target_offset))
		elif target_offset < offset:
			set_offset(offset + SPEED * delta)
