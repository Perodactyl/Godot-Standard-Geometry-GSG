tool
extends Control

var inf = null

onready var pg = $PanelContainer/Panel/VBoxContainer/PanelContainer/Panel/CenterContainer/Control/Polygon2D

func generate():
	var sides = $PanelContainer/Panel/VBoxContainer/SpinBox.value
	var size = $PanelContainer/Panel/VBoxContainer/SpinBox2.value
	var result = PoolVector2Array()
	var deg = 0
	for i in range(sides+1):
		deg += (360/sides)
		result.append(Vector2(cos(deg2rad(deg))*size,sin(deg2rad(deg))*size))
	return result


func do_stuff():
	var sel = inf.get_selection().get_selected_nodes()[0]
	var pol = Polygon2D.new()
	pol.polygon = generate()
	sel.add_child(pol)
	pol.owner = inf.get_edited_scene_root()


func change(_value):
	var poly = generate()
	pg.polygon = poly
