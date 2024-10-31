extends Area2D

@onready var mensaje = $Label

func _ready():
	mensaje.visible = false

func _on_area_2d_body_entered(body):
	if body is Player:
		mostrar_mensaje()

func mostrar_mensaje():
	mensaje.text = "Felicidades has completado el juego. Gracias por jugar :3"
	mensaje.visible = true
	
	await get_tree().create_timer(5).timeout
	get_tree().quit()
