extends KinematicBody2D

const acc = 25
const max_speed = 80
const friction = 80

# vector2 holds the coordinate of your object on the map
# since it is vector2 and not vector3 this is in reference to (x, y)
# of player
var motion = Vector2()

# built in function to Godot
# this function will run every frame whenever this object is in the scene
func _physics_process(delta):
	# get input from key board from key arrows
	var input = Vector2()
	# get_action_strength() returns the "axis strength" of an input. If "right" 
	# is a key input, its strength will be 1 (when pressed) or 0 when not. If it 
	# were an analog joystick, on the other hand, the value will be something 
	# between 0 and 1, depending on how far the joystick is moved.
	# Subtracting left from right means the value of this is going to end up being 1 
	# (if just "right" is held), -1 (if just "left" is held), or 0 if both are held.
	# UI_RIGHT IS an input setting set to a certain type of keys on the keyboard within
	# project, project settings, input_map. For example "D" could also be labeled under ui_right.
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
