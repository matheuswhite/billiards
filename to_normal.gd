extends Node

func _ready():
	var bump_tex: Texture2D = load("res://assets/brick_material/bump.jpg")
	var img: Image = bump_tex.get_image()

	# Converte o bump (tons de cinza) em normal map RGB
	# O valor 1.0 é a intensidade do relevo (você pode ajustar)
	img.bump_map_to_normal_map(1.0)

	# Salva como uma nova textura normal map
	img.save_png("res://assets/brick_material/normal.png")

	print("✅ Normal map criado com sucesso")
