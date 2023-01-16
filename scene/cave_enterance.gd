extends Area2D

# when you click on the node in the scene which houses this script
# (in this case the cave entrance area 2d node)
# there will be a new script variable available in the nodes properties
# which will be labeled as the var name you give to it (New Scene).
# in this case since we are exporting a packed scene, this script variable will 
# allow us to select a scene to put into the new_scene variable from the
# cave_entrance's inspector menu (usually menu on right side)
export(PackedScene) var new_scene

# built in function for godot to get the input from user
func _input(event):
	# if user presses enter key
	if event.is_action_pressed("ui_accept"):
		# check if the player and this area2D's collision area is overlapping
		# get_overlapping_bodies returns a list of intersecting PhysicsBody2D
		# with this area object. Since the only one we have is the player it
		# will check for the player.
		# the size function will return true or false with 1 or 0 if there
		# is a physics body intercepting
		# checking to make sure the player is overlapping, it will be
		# 1 if they are
		if get_overlapping_bodies().size() > 0:
			next_level()
			
func next_level():
	print('')
