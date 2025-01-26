class_name MovementInterface
extends Interface

@export var parent: CharacterBody3D
@export var stats: EntityStats

@export var acceleration_rate: float = 1.0
@export var deceleration_rate: float = 1.0


func _move(_delta: float, _speed: float, _max_speed: float) -> void:
	_assert_func_unset("move")


func walk(_delta: float) -> void:
	_assert_func_unset("walk")


func run(_delta: float) -> void:
	_assert_func_unset("run")


func is_idle() -> bool:
	_assert_func_unset("is_idle")
	return false


func jump(_delta: float) -> void:
	_assert_func_unset("jump")


func fall(_delta: float) -> void:
	_assert_func_unset("fall")


func get_movement_direction() -> Vector2:
	_assert_func_unset("get_movement_direction")
	return Vector2.ZERO


func wants_to_jump() -> bool:
	_assert_func_unset("wants_to_jump")
	return false


func wants_to_run() -> bool:
	_assert_func_unset("wants_to_run")
	return false
