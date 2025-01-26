extends Entity

@onready var state_machine := $StateMachine
@onready var skin := $DummySkin


func _ready() -> void:
	state_machine.init()


func _process(delta: float) -> void:
	state_machine.process_frame(delta)


func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)


func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)


func rotate_skin(direction: Vector2, delta: float) -> void:
	# Godot assumes models face the X positive direction by default,
	# but the skin faces the Z positive, rotate by 90 degrees (PI/2) to adjust.
	# Offset the rotation by the player node's y rotation in case the Player
	# parent scene rotates the Player.
	var angle_offset = PI / 2 - rotation.y
	var target_angle = -direction.angle() + angle_offset
	var rotation_speed = 6.0
	skin.rotation.y = rotate_toward(skin.rotation.y, target_angle, rotation_speed * delta)
