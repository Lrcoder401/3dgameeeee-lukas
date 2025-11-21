
extends Camera3D
'''
var twist_input := 0
var pitch_input := 0
var camera_rot_x = rotation_degrees.x
var mouse_sensitivity := 0.00000000000001
var mouseDelta : Vector2 = Vector2()
@onready var mouse_motion = get_viewport()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees -= Vector3(rad_to_deg(mouseDelta.y), 0, 0) * mouse_sensitivity * delta
	rotation_degrees.x = clamp(rotation_degrees.x, -40, +40)
	rotation_degrees -= Vector3(0, rad_to_deg(mouseDelta.x), 0) * mouse_sensitivity * delta
	mouseDelta = Vector2()
	#rotate_y(-mouse_motion.rotation.x * mouse_sensitivity)
	#rotate_x(-mouse_motion.rotation.y * mouse_sensitivity)
	rotation.x = clamp(
		rotation.x,
		-PI/2,
		+PI/2
	)	
	

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			rotate_y(-event.relative.x * mouse_sensitivity)
			rotate_x(-event.relative.y * mouse_sensitivity)
			rotation.x = clampf(rotation.x, -deg_to_rad(20), deg_to_rad(20))

	if event is InputEventMouseMotion:
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			rotate_y(-event.relative.x * mouse_sensitivity)
			camera_rot_x = rotation.x - event.relative.y * mouse_sensitivity
			camera_rot_x = clampf(camera_rot_x, -deg_to_rad(20), deg_to_rad(20))
			rotate_x(-event.relative.y * mouse_sensitivity)
			rotation.x = clampf(rotation.x, -deg_to_rad(20), deg_to_rad(20))
			rotation.x = camera_rot_x
			twist_input = - event.relative.x * mouse_sensitivity
			pitch_input = - event.relative.y * mouse_sensitivity

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouseDelta = event.relative
		


	
	
'''
