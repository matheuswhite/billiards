extends Area3D

var points: int = 0
signal new_point(ball)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func end_game():
	print("Loading game over")
	get_tree().change_scene_to_file("res://game_over.tscn")
	
func win_game():
	print("Loading win game")
	get_tree().change_scene_to_file("res://win_game.tscn")

func _on_body_entered(body: Node3D) -> void:
	print(body.name)
	
	if !body.name.begins_with("ball"):
		print("Doesn't begins with ball")
		return
	
	if body.name == "ball_white":
		end_game()
	
	var ball_point = int(body.name.substr("ball".length()))
	
	if body.name == "ball8":
		if points < 112:
			end_game()
		else:
			win_game()
	else:
		points += ball_point
		emit_signal("new_point", body.name)
		print("points: ", points)
		body.queue_free()
