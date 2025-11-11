extends MeshInstance3D

var hole_trigger: Area3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hole_trigger = get_node("/root/Game/table/hole_trigger")
	hole_trigger.connect("new_point", Callable(self, "_on_new_point"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(Vector3.UP, 0.01)

func _on_new_point(ball: String):
	if ball == name:
		show()
