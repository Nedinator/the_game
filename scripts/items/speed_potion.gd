extends Area2D




func _on_body_entered(body):
	print("Speed potion picked up!")
	queue_free()
