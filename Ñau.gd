extends KinematicBody2D
var velocitat = 230
var direccio = Vector2.UP
var vel_gir = 7
export var Dispar: PackedScene
var vida = 100
func _ready():
	Global.Nau = self


func _process(delta):

	if Input.is_action_pressed("Avañça"):
		direccio =  Vector2.UP.rotated(rotation)
		position = global_position + direccio * velocitat * delta
	if Input.is_action_pressed("Gir esquerre"):
		rotate(-vel_gir * delta)
	if Input.is_action_pressed("Gir Dret"):
		rotate(vel_gir * delta)
	move_and_slide(direccio)
	if Input.is_action_just_pressed("Dispara"):
		crea_dispar()


func crea_dispar():
	var nou_dispar = Dispar.instance()
	nou_dispar.direccio = Vector2.UP.rotated(rotation) 
	nou_dispar.global_position = global_position
	Global.Bales.add_child(nou_dispar)

func hit(mal):
	self.vida-= mal
	if vida <= 0:
		queue_free()

