extends MeshInstance3D


@export var speed:float = 10
@export var rot_speed = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var f = Input.get_axis("move_back", "move_forward")
	
	translate(Vector3(0, 0, f * delta * speed))
	
	rotate_y(deg_to_rad(rot_speed)* delta )
	
	pass
