extends RayCast3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		print("BANG")
		if is_colliding() :
			var obj = get_collider()
			if obj.get_parent().is_in_group("enemy group") :  
				obj.get_node("health").take_damage(4)
			#queue_free
		#obj.get_parent().queue_free( )
		#if (obj.is_in_group("apple")): 
			#emit_
			#obj.queue_free()
