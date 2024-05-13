extends Node2D

var SPEED = 50
var direction = 1

signal dead

@onready var animated_sprite = $AnimatedSprite2D
@onready var raycast_right = $RaycastRight
@onready var raycast_left = $RaycastLeft

func _process(delta):
	if raycast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	elif raycast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	position.x += direction * SPEED * delta

func _on_killzone_body_entered(body):
	dead.emit()
