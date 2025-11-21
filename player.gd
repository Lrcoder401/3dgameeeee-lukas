extends CharacterBody3D

@onready var ray_cast_3d = $RayCast3D
@onready var MainCamera = get_node("Camera3D")
#@onready var Player = get_node("Player")
var CameraRotation = Vector2(0,0)
var PlayerRotaion = Vector2(0,0)
@export var MouseSenstivity = 0.001
@export var movement = Vector3()
var dead = false 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # Replace with function body.
	print(get_node("/root/").name)
	
func _unhandled_input(event) :
	
	if not dead :
		if event.is_action_pressed("ui_cancel"): 
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if event.is_action_pressed("ui_text_newline"): 
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
		if event is InputEventMouseMotion:
			var MouseEvent  = event.relative * MouseSenstivity
			CameraLook(MouseEvent)

		
			
func CameraLook(Movement: Vector2):
	CameraRotation += Movement
	CameraRotation.y = clamp(CameraRotation.y,-1,1.5)
	
	#transform.basis = Basis()
	#MainCamera.transform.basis = Basis()
	#P
	#rotate_object_local(Vector3(0,1,0), -CameraRotation.x)
	#
	#
	#rotate_object_local(Vector3(0,1,0), -CameraRotation.x)
	#MainCamera.rotate_object_local(Vector3(1,0,0), -CameraRotation.y)
	#rotation.x = -CameraRotation.y
	MainCamera.rotation.x = -CameraRotation.y
	#rotation.x = -CameraRotation.y
	#MainCamera.rotation.y = -CameraRotation.x
	rotation.y = -CameraRotation.x
	#CameraRotation.x = -CameraRotation.y
	#MainCamera.y = -CameraRotation.x
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if not dead : 
		$"HUD/HP".text = "HP: "+str($"health".health)
		var movement = Vector3()
		var input = Input.get_action_strength("move_forward")
		movement += input * basis.z * -300.0 * delta

		input = Input.get_action_strength("move_backward")
		movement += input * basis.z * 300.0 * delta
		
		input = Input.get_action_strength("move_left")
		movement += input * basis.x * -300.0 * delta
			
		input = Input.get_action_strength("move_right")
		movement += input * basis.x * 300.0 * delta
		
		velocity.x = movement.x
		velocity.z = movement.z
		#velocity.y = movement.y

		if is_on_floor() :
			input = Input.get_action_strength("ui_select")
			velocity.y = 7*input
			
		if Input.is_key_pressed(KEY_J):
			$"health".take_damage(100)
	velocity += get_gravity()*delta
	move_and_slide()
#wwwww



func _on_health_dead() -> void:
	var scene_to_gameover = load("res://gameover.tscn").instantiate()
	add_child(scene_to_gameover)
	dead = true 
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	
