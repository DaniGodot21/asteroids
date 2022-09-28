extends Area2D

var direccio = Vector2.UP
var angle = 0
var velocitat = 500
var vida = 200
func _ready():
	randomize()
	angle = rand_range(0,180)
	direccio = direccio.rotated(angle)

func _physics_process(delta):
	position = position + direccio * velocitat * delta
	position.x = int(position.x) % 1024
	position.y = int(position.y) % 600

func hit(damage):
	vida -= 50
	if vida <= 0:
		queue_free()
