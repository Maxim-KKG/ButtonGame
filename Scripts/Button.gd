extends Area2D

@export var isBlue = false
var isOn = false
var count = 0.0
var stop = false
var timer = 0
const explosion = preload("res://Scenes/Explosion.tscn")
const click = preload("res://Scenes/Click.tscn")

func _on_mouse_entered():
	isOn = true

func _on_mouse_exited():
	isOn = false

func _process(delta):
	if stop:
		return
	timer -= delta
	$Label.text = str(count)
	if Input.is_action_just_pressed("action") and isOn and timer < 0:
		timer = 0.3
		if randf()/2.0 > count/100.0:
			spawn()
			count += 1
			$AnimationPlayer.play("Press")
		else:
			count = 0
			$Sprite.frame = 2
			$Label.text = str(count)
			get_tree().call_group("Manager","stop")

func spawn():
	var e = explosion.instantiate()
	e.global_position = global_position
	e.emitting = true
	var c = click.instantiate()
	c.pitch_scale += randf()/2
	if isBlue:
		e.modulate = Color("285cc4")
	else:
		e.modulate = Color("b4202a")
	get_parent().add_child(e)
	get_parent().add_child(c)
