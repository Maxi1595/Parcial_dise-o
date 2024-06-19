extends CharacterBody2D
class_name Enemy

var direccion := 1
@export var gravity := 90
@export var speed := -50

func _ready():
	velocity.x = speed
	$AnimatedSprite2D.play("Run")

func _physics_process(delta):
	
	$AnimatedSprite2D.scale.x=direccion
	
	if not $AnimatedSprite2D/RayCast2D.is_colliding() or is_on_wall() :
		direccion *= -1 
		
	velocity.y = gravity
	velocity.x = speed * direccion
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body is Player:
		body._perderVida_enemigo(position.x)

