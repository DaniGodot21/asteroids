extends Area2D
var direccio = Vector2.UP
var angle = 0
var velocitat = 250
var vida = 100

var mal = 20
func _ready():
	randomize()
	angle = rand_range(0,180)
	direccio = direccio.rotated(angle)

func _physics_process(delta):
	position = position + direccio * velocitat * delta
	position.x = int(position.x) % 1024
	position.y = int(position.y) % 600


func hit(damage):
	vida -= damage
	if vida <= 0:
		crea_mini_asteroides()
		crea_mini_asteroides()
		queue_free()

func crea_mini_asteroides():
		if scale.x <= 0.28:
			print ('poto')
			queue_free()
		var mini_asteroides = load("res://Asteroid.tscn").instance()
		mini_asteroides.set_deferred('scale', scale/1.5)
		mini_asteroides.mal = mal/1.5
		mini_asteroides.position = global_position
		Global.Creador.add_child(mini_asteroides)


func _on_Asteroid_body_entered(body):
	body.hit(mal)
	print (Global.Nau.vida)
