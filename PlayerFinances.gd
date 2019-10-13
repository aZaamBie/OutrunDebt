extends Node

var balance setget set_balance

signal buy_property(buyer, property)
signal bankrupt
signal pay_player(giver, recipient, amount)

func _ready():
	balance = 1500
	$Buy.hide()
	$Pass.hide()

func _on_property_entered(property):
	if property.holder:
		emit_signal("pay_player", self, property.holder, property.rent)
		return
	
	if property.price > balance:
		return
	
	property.show_info()
	
	$Buy.show()
	$Pass.show()
	while not ($Buy._is_pressed() or $Pass._is_pressed()):
		pass
	$Buy.hide()
	$Pass.hide()
	emit_signal("buy_property", self, property)

func set_balance(new_balance):
	balance = new_balance
	if balance < 0:
		emit_signal("bankrupt")
		balance = 0
