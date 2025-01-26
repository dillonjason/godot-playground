extends State

@export var idle_state: State
@export var walk_state: State
@export var jump_state: State
@export var fall_state: State


func process_input(_event: InputEvent) -> State:
	if movement.wants_to_jump() and parent.is_on_floor():
		return jump_state

	if !movement.wants_to_run():
		return walk_state

	return null


func process_physics(delta: float) -> State:
	movement.run(delta)
	parent.move_and_slide()

	if !parent.is_on_floor():
		return fall_state

	if movement.is_idle():
		return idle_state

	return null
