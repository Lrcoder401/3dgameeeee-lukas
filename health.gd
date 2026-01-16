extends Node

@export var maxhealth: float

var health

signal dead 

func _ready() -> void:
	health = maxhealth


func take_damage(value) :
	health -= value
	if health <= 0 :
		emit_signal("dead") 
		

func heal(value) :
	if health < maxhealth :
		health += value
		if health > maxhealth :
			health = maxhealth
	#100	
		
func set_health(value) :
	health = value 
