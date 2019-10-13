extends Node


func _ready():
	pass

func _on_player_pay_player(giver, recipient, amount):
	giver.set_balance(giver.balance - amount)
	recipient.set_balance(recipient.balance + amount)

func _on_player_buy_property(buyer, property):
	buyer.set_balance(buyer.balance - property.price)
	property.holder = buyer.get_path()
