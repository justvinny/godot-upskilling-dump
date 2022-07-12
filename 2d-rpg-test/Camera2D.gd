extends Camera2D

var player: KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("/root/Main/MaleSprite")

func _process(delta):
	position = player.position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
