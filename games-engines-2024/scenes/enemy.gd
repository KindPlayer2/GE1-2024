extends MeshInstance3D

@onready var tank:Node = $"../tank"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var to_player = tank.global_position - global_position
	to_player = to_player.normalized()
	
	var forw = global_transform.basis.z
	
	DebugDraw2D.set_text("enemy_to_player", to_player)
	DebugDraw2D.set_text("forw", forw)
	
	var axis = to_player.cross(forw)
	
	var theta = acos(to_player.dot(forw))
	
	DebugDraw2D.set_text("angle to player", rad_to_deg(theta))
	
	rotation = Vector3(0, - theta, 0)
	
	pass
