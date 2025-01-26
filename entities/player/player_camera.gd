class_name PlayerCamera
extends SpringArm3D

@export var min_limit_x: float
@export var max_limit_x: float
@export var mouse_enabled := true
@export var horizontal_acceleration := 2.0
@export var vertical_acceleration := 1.0
@export var mouse_acceleration := 0.005


func _process(delta: float) -> void:
	var joy_dir = Input.get_vector("pan_left", "pan_right", "pan_up", "pan_down")
	rotate_from_vector(joy_dir * delta * Vector2(horizontal_acceleration, vertical_acceleration))


func _input(event: InputEvent) -> void:
	if not mouse_enabled:
		return
	if event is InputEventMouseMotion:
		rotate_from_vector(event.relative * mouse_acceleration)


func rotate_from_vector(v: Vector2):
	if v.length() == 0:
		return
	rotation.y -= v.x
	rotation.x = clamp(rotation.x - v.y, min_limit_x, max_limit_x)
