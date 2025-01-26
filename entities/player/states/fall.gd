extends State

@export var idle_state: State
@export var walk_state: State
@export var run_state: State


func process_physics(delta: float) -> State:
	movement.fall(delta)
	parent.move_and_slide()

	if parent.is_on_floor():
		if movement.is_idle():
			return idle_state
		elif movement.wants_to_run():
			return run_state
		else:
			return walk_state

	return null
