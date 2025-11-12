extends Node

func _ready():
	var glossiness_tex: Texture2D = load("res://assets/wood_floor/Wood_Floor_001_Spec_Gloss.jpg")
	var img: Image = glossiness_tex.get_image()

	# Percorre cada pixel e inverte os valores RGB
	for y in range(img.get_height()):
		for x in range(img.get_width()):
			var color: Color = img.get_pixel(x, y)
			# Inverte cada canal de cor
			color.r = 1.0 - color.r
			color.g = 1.0 - color.g
			color.b = 1.0 - color.b
			img.set_pixel(x, y, color)

	# Salva como nova textura roughness
	img.save_png("res://assets/wood_floor/Wood_Floor_001_Roughness.png")

	print("✅ Roughness map criado com sucesso!")
