extends Camera3D

@export var white_ball: RigidBody3D
const speed = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = white_ball.position + Vector3(0, 50, 30)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			global_position -= global_basis.z * speed
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			global_position += global_basis.z * speed
	elif event is InputEventKey:
		if event.is_released() and event.keycode == KEY_SPACE:
			white_ball.apply_impulse(Vector3(0, 0, -50), Vector3(0, 1, 0))
