extends Node

#@export var totalpoints: float

var points


func _ready() -> void:
	points = 0
			

func add_points(value) :
	points += value
	#100	
		
func set_points(value) :
	points = value 
