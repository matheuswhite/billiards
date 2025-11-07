extends ColorRect

@export var camera: Camera3D;
const max_height: float = 280;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var impulse_force = camera.impulse_force
	size.y = max_height * (1 - impulse_force)
