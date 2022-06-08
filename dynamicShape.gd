tool
extends Polygon2D
class_name DynamicShape

export(int)var sides = 3 setget set_sides
export(float)var size = 30 setget set_size
export(bool)var include_parent = true
export(CircleShape2D)var clone
var isDShape = true

func _enter_tree():
	update()

func set_sides(val):
	if(val < 3):
		return ERR_INVALID_PARAMETER
	sides = val
	update()
	return OK

func set_size(val):
	size = val
	update()
	return OK

func update():
	var rsize = size
	if get_parent() && get_parent().get("isDShape"):
		rsize = size+(get_parent().size - 30)
	var result = PoolVector2Array()
	var deg = 0
	for i in range(sides+1):
		deg += (360/sides)
		result.append(Vector2(cos(deg2rad(deg))*rsize,sin(deg2rad(deg))*rsize))
	polygon = result
	if(clone):
		clone.radius = rsize
