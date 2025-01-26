extends State

@export var idle_state: State
@export var walk_state: State
@export var run_state: State
@export var fall_state: State


func enter() -> void:
	animation_tree.set("parameters/JumpOneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)


func process_physics(delta: float) -> State:
	movement.jump(delta)

	if parent.velocity.y > 0.0:
		return fall_state

	parent.move_and_slide()

	if parent.is_on_floor():
		if movement.is_idle():
			return idle_state
		elif movement.wants_to_run():
			return run_state
		else:
			return walk_state

	return null
