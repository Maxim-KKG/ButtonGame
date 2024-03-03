extends Area2D

var isOn = false

func _on_mouse_entered():
	isOn = true

func _on_mouse_exited():
	isOn = false

func _process(_delta):
	if Input.is_action_just_pressed("action") and isOn:
		get_parent().get_node("Text").stop()
