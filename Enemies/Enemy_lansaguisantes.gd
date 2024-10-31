extends CharacterBody2D

@onready var proyectilEscena = preload("res://Proyectil.tscn")
var gravity := 90

func _ready():
	$Timer.start()
	
func _physics_process(delta):
	velocity.y = gravity
	
	move_and_slide()

func shoot():
	$AnimationPlayer.play("attack")
	var proyectil = proyectilEscena.instantiate()
	get_parent().add_child(proyectil)
	proyectil.position = $Marker2D.global_position
	var direction = Vector2(-1, 0)
	proyectil.get_direction(direction)
	await get_tree().create_timer(3).timeout
	proyectil.queue_free()
	
func _on_timer_timeout():
	shoot()

func _on_area_2d_body_entered(body):
	if body is Player:
		if body.velocity.y >= 0:
			queue_free()
