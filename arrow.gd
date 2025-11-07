extends Node3D

@export var white_ball: PhysicsBody3D
@export var camera: Camera3D
var timer: float = 0
var distance = 15

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation.y = camera.azimuth
	
	timer += delta * 5
	
	var local_z = Vector3.FORWARD.rotated(Vector3.UP, camera.azimuth) * sin(timer) * 2 
	
	var x = distance * sin(camera.azimuth)
	var z = distance * cos(camera.azimuth)
	position = white_ball.position + Vector3(-x, -3, -z) + local_z
	
	if white_ball.linear_velocity.length() < camera.min_vel:
		show()
	else:
		hide()
