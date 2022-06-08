tool
extends EditorPlugin

var panel = null

func _enter_tree():
	panel = preload("res://addons/circles/panel.tscn").instance()
	panel.inf = get_editor_interface()
	var s1 = panel.get_node("PanelContainer/Panel/VBoxContainer/SpinBox")
	var s2 = panel.get_node("PanelContainer/Panel/VBoxContainer/SpinBox2")
	s1.connect("value_changed", panel, "change")
	s2.connect("value_changed", panel, "change")
	panel.get_node("PanelContainer/Panel/VBoxContainer/Button").connect("pressed", panel, "do_stuff")
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_UL,panel)

func _exit_tree():
	print("turn off")
	if panel:
		print("Remove Panel")
		remove_control_from_docks(panel)
		panel.queue_free()
