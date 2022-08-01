extends Viewport
class_name CodeViewport

onready var code = $"%Code"


func warmup():
	size = code.rect_size


func save() -> Image:
	var img := get_texture().get_data()
	return img
