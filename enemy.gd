extends MeshInstance3D
@onready var d = $"../Player".position - position 
var scene_to_explosion = preload("res://explosion.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"StaticBody3D/health".set_health(8) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var d = $"../Player".position - position 
	if d.length() > 0.75 :
		d = d.normalized() 
		position += d * delta * 4
	else :
		_on_health_dead()	
	
			


	


func _on_health_dead() -> void:
	queue_free()
	var new_scene = scene_to_explosion.instantiate()
	$"..".add_child(new_scene)
	new_scene.position = position
		
