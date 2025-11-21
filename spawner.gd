extends Node
@export var enemy_spawn_rate = 0.5
var enemy_spawn_timer = 0

@export var spawn_zone_corner_one = Vector3(-106.3,1,-99.82)
@export var spawn_zone_corner_two = Vector3(0.077,1,-24.72)

@export var enemy: PackedScene = preload("res://prism.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	enemy_spawn_timer += delta 
	if enemy_spawn_timer >= (1.0/enemy_spawn_rate): 
		enemy_spawn_timer = 0 
		var new_scene = enemy.instantiate()
		$"..".add_child(new_scene)
		#new_scene.position = position
		var x = randf_range(spawn_zone_corner_one.x,spawn_zone_corner_two.x)
		var y = randf_range(spawn_zone_corner_one.y,spawn_zone_corner_two.y)
		var z = randf_range(spawn_zone_corner_one.z,spawn_zone_corner_two.z)
		new_scene.position = Vector3(x,y,z) 
