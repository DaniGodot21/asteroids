extends Area2D

var direccio : Vector2 = Vector2.UP
var velocitat = 500



func _ready():
	rotation = direccio.angle() +deg2rad(90)


func _physics_process(delta):
	global_position = global_position + direccio * velocitat * delta

func _on_Dispar_area_entered(asteroid):
	asteroid.hit(100)
	queue_free()
