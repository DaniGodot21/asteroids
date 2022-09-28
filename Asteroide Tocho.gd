extends Area2D

var direccio = Vector2.UP
var angle = 0
var velocitat = 500
var vida = 200
var mal = 40
func _ready():
	randomize()
	angle = rand_range(0,180)
	direccio = direccio.rotated(angle)

func _physics_process(delta):
	position = position + direccio * velocitat * delta

func hit(damage):
	vida -= damage
	if vida <= 0:
		crea_mini_tocho()
		crea_mini_tocho()
		queue_free()



func crea_mini_tocho():
	if (scale/2).x <= 0.24:
		queue_free()
	var mini_tocho = load("res://Asteroide Tocho.tscn").instance()
	mini_tocho.set_deferred('scale', scale / 2)
	mini_tocho.mal = mal/2
	mini_tocho.position = global_position
	Global.Creador.add_child(mini_tocho)


func _on_Asteroide_Tocho_body_entered(body):
	body.hit(mal)
