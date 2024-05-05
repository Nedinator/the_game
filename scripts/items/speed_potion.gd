extends Area2D

signal speed_potion_collected
signal speed_potion_ended
@onready var timer = $Timer
@onready var sprite = $Sprite2D
@onready var collision_shape = $CollisionShape2D

func _on_body_entered(_body):
	print("Speed potion picked up!")
	speed_potion_collected.emit()
	timer.wait_time = 5.0
	timer.start()
	collision_shape.queue_free()
	sprite.queue_free()


func _on_timer_timeout():
	speed_potion_ended.emit()
	print("Speed no more")
	timer.stop()
