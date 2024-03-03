extends Node2D

var timer = 2
var done = false
const death = preload("res://Scenes/Death.tscn")

func _process(delta):
	if !done:
		return
	timer -= delta
	if timer < 0:
		get_tree().reload_current_scene()

func stop():
	var blue = get_parent().get_node("BlueButton")
	var red = get_parent().get_node("RedButton")
	get_parent().get_node("Retry").queue_free()
	if blue.count < red.count:
		$P1.visible = true
	if blue.count > red.count:
		$P2.visible = true
	if blue.count == red.count:
		$P3.visible = true
	blue.stop = true
	red.stop = true
	done = true
	var d = death.instantiate()
	get_parent().add_child(d)
