extends CharacterBody2D

@export var max_speed: int = 100
@export var acceleration: int = 10
@export var friction: int = 5

var move_vector: Vector2 = Vector2.ZERO

func _physics_process(delta: float):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		move_vector += input_vector * acceleration * delta
		move_vector = move_vector.clampf(-max_speed * delta, max_speed * delta)
	else:
		move_vector = move_vector.move_toward(Vector2.ZERO, friction * delta) 

	move_and_collide(move_vector)
