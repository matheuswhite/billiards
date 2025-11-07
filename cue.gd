extends Node3D

@export var white_ball: PhysicsBody3D
@export var camera: Camera3D
@onready var default_z

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	default_z = position.z


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if white_ball.linear_velocity.length() < camera.min_vel:
		show()
	else:
		hide()

	position.z = default_z + 5.0 * camera.impulse_force
