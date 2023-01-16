extends Area2D

# when you click on the node in the scene which houses this script
# (in this case the cave entrance area 2d node)
# there will be a new script variable available in the nodes properties
# which will be labeled as the var name you give to it (New Scene).
# in this case since we are exporting a file selection tool that will
# allow us to select a scene file (ending in tscn or scn) 
# to put into the new_scene variable from the
# cave_entrance's inspector menu (usually menu on right side).
# we can then use a ref to that scene and make logic for it within this
# script using the new_scene var
export(String, FILE, "*.tscn,*.scn") var new_scene

# get the global script we created and import it to the variable Global 
# so we can access the global variables
# inside of the script
onready var Global = get_node("/root/Global")

# built in function for godot to get the input from user
func _input(event):
	# if user presses enter key
	if event.is_action_pressed("ui_accept"):
		# check if the player and this area2D's collision area is overlapping
		# get_overlapping_bodies returns a list of intersecting PhysicsBody2D
		# with this area object. This includes kinematic bodies, static bodies
		# etc
		var list_of_bodies = get_overlapping_bodies()
		print(get_overlapping_bodies())
		# check each body and get its name. if the name is our player node
		# then run the next_level function.
		# we could also use get_overlapping_bodies().size() > 0
		# if no other static or kinematic body was touching
		# but this current way checks no matter how many bodies are colliding
		for body in list_of_bodies:
			if body.get_name() == "player":
				next_level()


func next_level():
	# will get the current node housing the script. Which is the cave_entrance node
	# owner, will then go all the way to the top of the current SCENE tree
	# not the root tree, and get the node there. Which would be the world node or
	# cave node.
	# find_node will then search all levels of that scene tree to find the node
	# named player. Not just the top layer, even multiple levels deep.
	# we now have a reference to the player node in the current scene
	# (whether it is the player node in world scene or the cave scene)
	var player = get_node('.').owner.find_node("player")
	# save the global var to the current position where they entered
	# only if there isnt a position saved already
	if Global.player_last_pos == Vector2.ZERO:
		Global.player_last_pos.x = player.position.x
		Global.player_last_pos.y = player.position.y
		print(Global.player_last_pos)
	get_tree().change_scene(new_scene)
	
	
