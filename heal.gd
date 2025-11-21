extends MeshInstance3D
@export var timer: float

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	await get_tree().create_timer(timer).timeout
	#var tween = create_tween()
	#tween.set_parallel()
	#tween.tween_property(self, "scale", Vector3(3, 3, 3), 0.5)
	#tween.tween_property(self, "transparency",1.5,1)
	#await tween.finished 
	queue_free()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	var body_health=body.get_node("health")
	if body_health != null :
		body_health.heal(20)
	
