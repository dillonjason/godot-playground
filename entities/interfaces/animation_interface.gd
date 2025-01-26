class_name AnimationInterface
extends Interface

@export var animation_tree: AnimationTree

func fire_one_shot(parameter_path: String) -> void:
	_assert_func_unset("fire_one_shot")
	
func abort_one_shot(parameter_path: String) -> void:
	_assert_func_unset("abort_one_shot")

func travel(parameter_path: String, node_name: String) -> void:
	_assert_func_unset("travel")
