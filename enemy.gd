extends MeshInstance3D
var scene_to_explosion = preload("res://explosion.tscn")
@onready var d = $"../Player".position - position 
@export var speed = 4

# Called when the node enters the scene tree for the first time.
var player_body_collide = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var d: Vector3 = $"../Player".position - position 
	if d.length() > 0.75 :
		d = d.normalized() 
		position += d * delta * speed
		
	else :
		player_body_collide = true
		_on_health_dead()

func _on_health_dead() -> void:
	queue_free()
	var new_scene = scene_to_explosion.instantiate()
	$"..".add_child(new_scene)
	new_scene.position = position
	#var player_points=get_node("/root/Node3D/Player/points")
	var player_points=$"../Player/points"
	if player_body_collide == false :
		player_points.add_points(10)
	else :	
		player_points.add_points(-30)
