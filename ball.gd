@tool
extends RigidBody3D

@export var material: StandardMaterial3D:
	set(value):
		material = value
		
		var mesh = $MeshInstance3D
		if not mesh or not material:
			return
		
		mesh.material_override = material
		print("new material")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mesh = $MeshInstance3D
	
	if material:
		mesh.material_override = material

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if linear_velocity.y > 0:
		linear_velocity.y = 0
