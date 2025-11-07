extends Camera3D

@export var white_ball: RigidBody3D
var azimuth: float = 0.0
var elevation: float = PI / 4
var sensitivity: float = 0.05
var direction: Vector3 = Vector3(0, 0, -1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var distance = 30
	
	if Input.is_key_pressed(KEY_LEFT):
		azimuth += sensitivity
	if Input.is_key_pressed(KEY_RIGHT):
		azimuth -= sensitivity
	if Input.is_key_pressed(KEY_UP):
		elevation += sensitivity
	if Input.is_key_pressed(KEY_DOWN):
		elevation -= sensitivity
		
	elevation = clampf(elevation, 0, PI / 3)

	var x = distance * cos(elevation) * sin(azimuth)
	var y = distance * sin(elevation)
	var z = distance * cos(elevation) * cos(azimuth)
	position = white_ball.position + Vector3(x, y, z)
	direction = -Vector3(x, 0, z).normalized()
	look_at(white_ball.position + Vector3(0, 10, 0))


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_released() and event.keycode == KEY_SPACE:
			white_ball.apply_impulse(direction * 200, Vector3(0, 1, 0))
