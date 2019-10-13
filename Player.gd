extends PathFollow

var move_to = 0
onready var banker = get_node("root/Board/Banker")

func _ready():
	$Finances.connect("pay_rent", banker, "_on_player_pay_rent")
	$Finances.connect("buy_property", banker, "_on_player_buy_property")

func _process(delta):
	if move_to > offset:
		set_offset(max(offset + 0.2 * delta, move_to))
	elif move_to < offset:
		set_offset(offset + 0.2 * delta)
 