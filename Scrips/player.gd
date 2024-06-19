extends CharacterBody2D
class_name Player

var speed := 120
var direccion := 0.0
var jump :=250
const gravity := 9
@export var vidas := 3
@export var death := false
var empuje = Vector2 (-80, 0)


func _ready():
	Global.player = self

func _physics_process(delta):
	direccion = Input.get_axis("ui_left","ui_right")
	velocity.x = direccion * speed
	
	if direccion != 0:
		$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.play("Idle")
	
	$Sprite2D.flip_h = direccion < 0 if direccion != 0 else $Sprite2D.flip_h
	
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y -= jump
		
	
	if !is_on_floor():
		velocity.y += gravity
		$AnimationPlayer.play("Fall")
		
	move_and_slide()

func actualizaInterfazFrutas():
	$PlayerGUI/VBoxContainer/HBoxContainer/FrutasLabel.text = str(Global.frutas)

func _perderVida_enemigo (enemigox):
	vidas -= 1
	
	if position.x < enemigox:
		velocity.x = -80
		velocity.y = -100
	if position.x > enemigox:
		velocity.x = 80
		velocity.y = -100
		
	if vidas <= 0:
		get_tree().reload_current_scene()

func _curarVida():
	if vidas <= 2:
		vidas += 1
		print ("te has curado, tienes estas cantidades de vida" + str(vidas))

func _on_area_2d_body_entered(body):
	if body is Enemy:
		body._eliminarEnemy()

func _perderVida_trampa ():
	vidas -= 1
	if vidas <= 0:
		get_tree().reload_current_scene()
