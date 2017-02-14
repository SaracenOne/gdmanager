extends Node

static func get_instance(p_tree, p_manager_group_name, p_name, p_parent_manager, p_instance_type, p_script):
	var managers = p_tree.get_nodes_in_group(p_manager_group_name)
	if(managers.size() == 0):
		var instance = null
		if(p_instance_type extends PackedScene):
			instance = p_instance_type.instance()
		else:
			instance = p_instance_type.new()
		instance.set_name(p_name)
		instance.set_script(p_script)
		instance.add_to_group(p_manager_group_name)
		if(p_parent_manager == null):
			p_tree.get_root().add_child(instance)
		else:
			var parent_instance = p_parent_manager.get_instance(p_tree, p_parent_manager)
			parent_instance.add_child(instance)
		return instance
	elif(managers.size() == 1):
		return managers[0]
	else:
		printerr("Multiple " + p_manager_group_name + " found!")
		return managers[0]