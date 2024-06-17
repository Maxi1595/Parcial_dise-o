extends Control

func _ready():
	$VBoxContainer/Iniciar.grab_focus()
	
func _on_iniciar_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	
func _on_salir_pressed():
	get_tree().quit()
