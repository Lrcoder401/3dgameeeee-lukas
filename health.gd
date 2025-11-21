extends Node

@export var maxhealth: float
 
var health = maxhealth
signal dead 
func take_damage(value) :
	health -= value
	if health <= 0 :
		emit_signal("dead") 
		

func heal(value) :
	if health <= maxhealth :
		health += value
		
		
func set_health(value) :
	health = value 
