extends CharacterBody2D
class_name Jefe

var vida = 2
var direccion := 1
@export var gravity := 90
@export var speed := -50
@onready var proyectilEscena = preload("res://Proyectil.tscn")


func _ready():
	velocity.x = speed
	$AnimatedSprite2D.play("Run")
	$Timer.start()

func _physics_process(delta):
	
	$AnimatedSprite2D.scale.x=direccion
	
	if not $AnimatedSprite2D/RayCast2D.is_colliding() or is_on_wall() :
		direccion *= -1 
	
	velocity.y = gravity
	velocity.x = speed * direccion
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body is Player:
		if body.velocity.y >= 0:
			queue_free()
#
#func daño (damage : int) -> void:
	#vida -= damage
#
	#if vida <= 0:
		#queue_free()
		#

func _on_zonaDaño_body_entered(body):
	if body is Player:
		body._perderVida_enemigo(position.x)


func shootLeft():
	var proyectil = proyectilEscena.instantiate()
	get_parent().add_child(proyectil)
	proyectil.position = $Marker2D.global_position
	var direction = Vector2(-1, 0)
	proyectil.get_direction(direction)
	await get_tree().create_timer(3).timeout
	proyectil.queue_free()
	
func shootRight():
	var proyectil = proyectilEscena.instantiate()
	get_parent().add_child(proyectil)
	proyectil.position = $Marker2D.global_position
	var direction = Vector2(1, 0)
	proyectil.get_direction(direction)
	await get_tree().create_timer(3).timeout
	proyectil.queue_free()
	
func _on_timer_timeout():
	shootLeft()
	shootRight()
