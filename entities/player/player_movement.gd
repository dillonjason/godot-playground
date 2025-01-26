class_name PlayerMovement
extends EntityMovement

@export var camera: PlayerCamera


func get_movement_direction() -> Vector2:
	var movement_input = Input.get_vector("left", "right", "forward", "backward")
	var movement_input_relative_to_camera = movement_input.rotated(-camera.global_rotation.y)
	return movement_input_relative_to_camera


func wants_to_jump() -> bool:
	return Input.is_action_just_pressed("jump")


func wants_to_run() -> bool:
	return Input.is_action_pressed("run")
