extends Camera3D

@export var white_ball: RigidBody3D
var azimuth: float = 0.0
var elevation: float = PI / 4
var sensitivity: float = 0.025
var direction: Vector3 = Vector3(0, 0, -1)
var impulse_timer: float = 0.0;
const impulse_max_time: float = 2;
var impulse_force: float = 0.0;
var impulse_dir: float = 1.0;
const min_vel: float = 1.0
const cue_max_force: float = 300.0
@onready var sound = $AudioStreamPlayer3D

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
	if Input.is_key_pressed(KEY_SPACE) and white_ball.linear_velocity.length() < min_vel:
		impulse_timer += delta * impulse_dir
		impulse_force = impulse_timer / impulse_max_time
		
		if impulse_force > 1.0:
			impulse_dir = -1.0;
			impulse_timer = impulse_max_time
		if impulse_force < 0.0:
			impulse_dir = 1.0
			impulse_timer = 0.0

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
			if white_ball.linear_velocity.length() < min_vel:
				sound.play()
			white_ball.apply_impulse(direction * impulse_force * cue_max_force, Vector3(0, 1, 0))
			impulse_timer = 0
			impulse_force = 0
			
