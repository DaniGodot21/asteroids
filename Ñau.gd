extends KinematicBody2D
var velocitat = 230
var direccio = Vector2.UP
var vel_gir = 7

func _ready():
	pass


func _process(delta):

	if Input.is_action_pressed("Avañça"):
		direccio =  Vector2.UP.rotated(rotation)
		position = global_position + direccio * velocitat * delta
	if Input.is_action_pressed("Gir esquerre"):
		rotate(-vel_gir * delta)
	if Input.is_action_pressed("Gir Dret"):
		rotate(vel_gir * delta)
	move_and_slide(direccio)
