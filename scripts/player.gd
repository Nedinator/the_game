extends CharacterBody2D

const SPEED = 150
var SPEED_MODIFIER = 1
const JUMP_VELOCITY = -250.0
var alive = true

@onready var animated_sprite = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("jump")
	
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED * SPEED_MODIFIER
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	if !alive:
		animated_sprite.play("death")
	elif !is_on_floor():
		animated_sprite.play("jump")
	elif direction < 0:
		animated_sprite.play("run")
		animated_sprite.flip_h = true
	elif direction > 0:
		animated_sprite.play("run")
		animated_sprite.flip_h = false
	else:
		animated_sprite.play("idle")

func _on_speed_potion_speed_potion_collected():
	SPEED_MODIFIER = 1.5

func _on_speed_potion_speed_potion_ended():
	SPEED_MODIFIER = 1

func _on_slime_dead():
	alive = false
