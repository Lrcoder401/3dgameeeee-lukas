extends Node

 
var health 
signal dead 
func take_damage(value) :
	health -= value
	if health <= 0 :
		emit_signal("dead") 
		

	
func set_health(value) :
	health = value 
