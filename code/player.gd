extends CharacterBody2D

@export var speed: int = 4
var move_vector = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if input_vector != Vector2.ZERO:
		move_vector = input_vector
	else:
		move_vector = Vector2.ZERO
		
	move_and_collide(move_vector * speed)
