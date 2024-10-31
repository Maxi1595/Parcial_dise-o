extends Area2D

func _on_Area2D_body_entered(body):
	if body is Player:
		get_tree().change_scene_to_file("res://world_final.tscn")


