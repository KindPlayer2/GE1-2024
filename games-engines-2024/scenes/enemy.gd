extends MeshInstance3D

@onready var tank:Node = $"../tank"

var q1:Quaternion
var q2:Quaternion

var t = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var to_player = tank.global_position - global_position
	to_player = to_player.normalized()
	
	var forw = global_transform.basis.z
	
	DebugDraw2D.set_text("enemy_to_player", to_player)
	DebugDraw2D.set_text("forw", forw)
	
	var axis = to_player.cross(forw)
	
	var theta = acos(to_player.dot(forw))
	
	q2 = Quaternion(axis, theta)
	q1 = global_basis.get_rotation_quaternion()
	t=0
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var q:Quaternion
	
	
	#commit commit
	if t < 1.0:
		t=t + delta
	else:
		t =t + 1
		
	q = q1.slerp(q2, t)
	global_basis = Basis(q)
	
	pass
