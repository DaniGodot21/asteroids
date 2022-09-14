extends Node2D

var direccio = Vector2.RIGHT


export var Asteroid : PackedScene


func _ready():
	$Timercreador.start()
	
func crea_asteroide():
	var nou_asteroid = Asteroid.instance()
	
	if randi()%2 == 0:
		nou_asteroid.global_position = $Esquerra.global_position
	else:
		nou_asteroid.global_position = $Dreta.global_position
		nou_asteroid.angle += 180
	add_child(nou_asteroid)





func _on_Timercreador_timeout():
	crea_asteroide()


func _on_Asteroidetocho_timeout():
	if randi()%2 == 0:
		nou_asteroid.global_position = $Esquerra.global_position
	else:
		nou_asteroid.global_position = $Dreta.global_position
		nou_asteroid.angle += 180
	add_child(nou_asteroid)

