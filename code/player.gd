extends CharacterBody2D

@export var max_speed: int = 80
@export var acceleration: int = 500
@export var friction: int = 500

var move_vector: Vector2 = Vector2.ZERO

@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

func _physics_process(delta: float):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		# animation_player.play("run_right")
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		animation_state.travel("Run")
		move_vector = move_vector.move_toward(input_vector * max_speed, acceleration * delta)
	else:
		animation_state.travel("Idle")
		move_vector = move_vector.move_toward(Vector2.ZERO, friction * delta) 

	velocity = move_vector
	move_and_slide()
