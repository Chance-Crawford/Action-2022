extends Node2D

# onready waits for scene to load all components before setting var.
# get the global script we created and import it to the variable Global 
# so we can access the global variables
# inside of the script
onready var Global = get_node('/root/Global')
# onready waits for scene to load all components before setting var.
# see cave_entrance.gd
# since this is already the root node of the scene we can just say find_node
# to search all node paths
onready var player = find_node("player")

func _ready():
	# if there is a previous position saved then that means the player is
	# coming back from the cave
	if Global.player_last_pos != Vector2.ZERO:
		# set the location back to where the player was when they entered
		# the cave
		player.position.x = Global.player_last_pos.x
		player.position.y = Global.player_last_pos.y
		# set global var back to 0 (it will be set again when they try
		# to enter the cave again)
		Global.player_last_pos = Vector2.ZERO

