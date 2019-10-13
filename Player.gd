extends PathFollow

export var SPEED = 20
var target_offset = 0
onready var banker = get_node("root/Board/Banker")

func _ready():
	$Finances.connect("pay_rent", banker, "_on_player_pay_rent")
	$Finances.connect("buy_property", banker, "_on_player_buy_property")

func _process(delta):
	if target_offset > offset:
		set_offset(max(offset + SPEED * delta, target_offset))
	elif target_offset < offset:
		set_offset(offset + SPEED * delta)
 