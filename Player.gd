extends PathFollow

var is_moving = false
onready var banker = get_node("root/Board/Banker")

func _ready():
	$Finances.connect("pay_rent", banker, "_on_player_pay_rent")
	$Finances.connect("buy_property", banker, "_on_player_buy_property")

func _process(delta):
	if is_moving:
		set_offset(offset + 0.1)
		print("player path offset: ", get_offset())

func _input(event):
	if event is InputEventMouseButton:
		is_moving = !is_moving