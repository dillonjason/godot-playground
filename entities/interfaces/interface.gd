class_name Interface
extends Node


func _assert_func_unset(func_name: String) -> void:
	assert(false, 'Error: Used unset function "' + func_name + '"')


func _assert_var_unset(var_name: String, value) -> void:
	assert(value != null, 'Error: "' + var_name + '" is not set')
