@tool
extends RigidBody3D

var can_play = true
@onready var sound = $AudioStreamPlayer3D
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

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	if not can_play:
		return
	
	for i in range(get_contact_count()):
		var collider = state.get_contact_collider_object(i)
		if collider == null:
			continue

		if collider.name.begins_with("ball"):
			print("collide")
			sound.pitch_scale = randf_range(0.9, 1.1)
			sound.play()
			can_play = false
			await get_tree().create_timer(0.3).timeout
			can_play = true
