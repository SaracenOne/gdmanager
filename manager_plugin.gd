tool
extends EditorPlugin

func get_name(): 
	return "GDManager"

func _enter_tree():
	add_custom_type("Manager","Node",preload("manager.gd"),preload("manager.png"))
func _exit_tree():
	remove_custom_type("Manager")