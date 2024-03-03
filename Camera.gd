extends Camera2D

var timer = 1

func _process(delta):
	if !get_parent().get_node("Text").done:
		return
	timer -= delta
	if timer < 0:
		timer = 0
	global_position = timer * Vector2(randf()-0.5,randf()-0.5) * 10
