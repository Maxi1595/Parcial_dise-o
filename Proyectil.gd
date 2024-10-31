extends Area2D

var direction = Vector2()
var speed = 140
var velocity

func _physics_process(delta):
	velocity = direction.normalized() * speed * delta
	position += velocity
	
func get_direction(new_direction):
	direction = new_direction

func _on_body_entered(body):
	if body is Player:
		body._perderVida_enemigo(position.x)
