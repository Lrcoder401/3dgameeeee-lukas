extends MeshInstance3D
var scene_to_Health = preload("res://health.tscn")
@export var timer: float

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	await get_tree().create_timer(timer).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	var body_health=body.get_node("health")
	print("hit")
	if body_health != null :
		body_health.heal(20)
		print("heal")
		queue_free()
	
