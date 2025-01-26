class_name State
extends Node

@export var animation_parameter_path: String
@export var enter_animation_name: String
@export var exit_animation_name: String

var parent: CharacterBody3D
var animation_tree: AnimationTree
var movement: MovementInterface


func enter() -> void:
	if animation_parameter_path and enter_animation_name:
		animation_tree.get(animation_parameter_path).travel(enter_animation_name)


func exit() -> void:
	if animation_parameter_path and exit_animation_name:
		animation_tree.get(animation_parameter_path).travel(exit_animation_name)


func process_input(_event: InputEvent) -> State:
	return null


func process_frame(_delta: float) -> State:
	return null


func process_physics(_delta: float) -> State:
	return null
