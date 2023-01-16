extends Area2D

# when you click on the node in the scene which houses this script
# (in this case the cave entrance area 2d node)
# there will be a new script variable available in the nodes properties
# which will be labeled as the var name you give to it (New Scene).
# in this case since we are exporting a file selection tool that will
# allow us to select a scene file (ending in tscn or scn) 
# to put into the new_scene variable from the
# cave_entrance's inspector menu (usually menu on right side)
export(String, FILE, "*.tscn,*.scn") var new_scene

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
	get_tree().change_scene(new_scene)
