extends State

@export var jump_state: State
@export var walk_state: State
@export var run_state: State
@export var fall_state: State


func process_input(_event: InputEvent) -> State:
	if movement.wants_to_jump() and parent.is_on_floor():
		return jump_state
	if movement.get_movement_direction() != Vector2.ZERO:
		if movement.wants_to_run():
			return run_state
		else:
			return walk_state

	return null


func process_physics(delta: float) -> State:
	# Trigger fall to apply gravity, detect if anything happens to the floor
	# while idle
	movement.fall(delta)
	parent.move_and_slide()

	if !parent.is_on_floor():
		return fall_state

	return null
