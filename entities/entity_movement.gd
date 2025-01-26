class_name EntityMovement
extends MovementInterface

#Jump
@export var jump_height := 2.25
@export var jump_time_to_peak := 0.4
@export var jump_time_to_descent := 0.3

var jump_velocity: float:
	get:
		return ((2.0 * jump_height) / jump_time_to_peak) * -1.0
var jump_gravity: float:
	get:
		return ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
var fall_gravity: float:
	get:
		return ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0


func _get_parent_velocity_2d() -> Vector2:
	return Vector2(parent.velocity.x, parent.velocity.z)


func _get_current_speed() -> float:
	return _get_parent_velocity_2d().length()


func _move(delta: float, speed: float, max_speed: float) -> void:
	_assert_var_unset("parent", parent)
	_assert_var_unset("stats", stats)

	var direction := get_movement_direction()
	var velocity := _get_parent_velocity_2d()

	if direction != Vector2.ZERO:
		parent.rotate_skin(direction, delta)
		velocity += direction * speed * delta * acceleration_rate
		velocity = velocity.limit_length(max_speed)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration_rate * delta)

	parent.velocity.x = velocity.x
	parent.velocity.z = velocity.y


func walk(delta: float) -> void:
	_get_current_speed()
	_assert_var_unset("stats", stats)
	_move(delta, stats.speed, stats.speed)


func run(delta: float) -> void:
	_assert_var_unset("stats", stats)
	var running_speed = stats.speed * stats.running_speed_modifier
	_move(delta, running_speed, running_speed)


func jump(delta: float) -> void:
	_assert_var_unset("stats", stats)
	var aerial_speed = stats.speed * stats.aerial_speed_modifier
	var current_speed = maxf(_get_current_speed(), aerial_speed)
	_move(delta, aerial_speed, current_speed)
	parent.velocity.y = -jump_velocity - jump_gravity * delta
	print(parent.velocity.y)


func fall(delta: float) -> void:
	_assert_var_unset("stats", stats)
	var aerial_speed = stats.speed * stats.aerial_speed_modifier
	var current_speed = maxf(_get_current_speed(), aerial_speed)
	_move(delta, aerial_speed, current_speed)
	parent.velocity.y -= fall_gravity * delta


func is_idle() -> bool:
	var has_move_input = get_movement_direction() != Vector2.ZERO
	var is_still = parent.velocity.x == 0.0 and parent.velocity.z == 0.0
	return !has_move_input && is_still
