extends KinematicBody2D

const acc = 25
var max_speed = 50
const friction = 80

# vector2 holds an x and y coordinate
# since it is vector2 and not vector3 this vector will hold (x, y)
# in this case this vectore object is initialized to (0,0) since nothing
# is provided in parentheses
var motion = Vector2()

# running variables
var is_running = null
const walk_speed = 50
const run_speed = 80

# built in function to Godot
# this function will run every physics frame. It is used to perform 
# physics-related tasks, such as updating the position of nodes based 
# on their velocity, checking for collisions, and so on.

# The DELTA parameter of the _physics_process function represents the 
# elapsed time in seconds since the last physics frame. This value 
# can be used to calculate the elapsed time in physics frames and 
# to adjust the physics calculations accordingly. For example, if 
# the elapsed time is longer than usual, you may need to perform more 
# physics calculations to ensure that the physics simulation remains accurate.
# Here is an example of how you might use the delta parameter in the _physics_process function:
# func _physics_process(delta):
	# Calculate the elapsed time in physics frames
	# elapsed_time = delta * physics_fps
	# Update the position of the node based on its velocity
	# position += velocity * elapsed_time
# By using the delat parameter you can ensure that the physics calculations 
# are consistent and accurate regardless of the users frame rate

# a PHYSICS FRAME is a unit of time in the physics simulation. The physics 
# simulation runs independently of the rendering frame rate, and the elapsed 
# time between physics frames is called the physics step.
# The physics frame rate is the number of physics frames that are processed 
# per second. By default, the physics frame rate is set to 60 frames per
# second, but it can be changed in the project settings. The physics frame 
# rate should be set to a value that is appropriate for the game you are creating. 
# For example, if you are creating a fast-paced action game with lots of 
# moving objects, you may want to set the physics frame rate to a higher 
# value to ensure that the physics simulation is accurate.
func _physics_process(delta):
	# get input from key arrows on keyboard to move player character
	# create a new vector object initialized at (0, 0)
	var input = Vector2()
	# get_action_strength() returns the "axis strength" of an input. If "right" 
	# is a key input, its strength will be 1 (when pressed) or 0 when not. If it 
	# were an analog joystick, on the other hand, the value will be something 
	# between 0 and 1, depending on how far the joystick is moved.
	# Subtracting left from right means the value of this is going to end up being (1, 0) 
	# (if just "right" is held), (-1, 0) (if just "left" is held), or 0 if both are held.
	# UI_RIGHT IS an input setting set to a certain type of keys on the keyboard within
	# project, project settings, input_map. For example "D" could also be labeled under ui_right.
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	# This line takes the resulting value and normalizes it. Normalizing a vector means 
	# setting its length to 1 while keeping the direction the same. 
	# This is used so that diagonal movement ("down" and "right", for example), 
	# won't be faster, since the length of (1, 1) would be 1.414.
	input = input.normalized()
	
	# created custom key press "run" in project settings (tied to shift key)
	# if pressed will change is_running var to true, if just released will switch back to 
	# false again
	if Input.is_action_pressed("run"):
		is_running = true
	if Input.is_action_just_released("run"):
		is_running = false
		
	# if input vector object is not still (0, 0)
	# meaning a arrow key is being pressed
	if input != Vector2.ZERO:
		
		# if moving to right
		if input.x > 0:
			# change animated sprite child node to not be flipped horizontally
			$AnimatedSprite.flip_h = false
			# play different animation for node
			# based on if currently running or not
			if is_running:
				$AnimatedSprite.play("run")
			else:
				$AnimatedSprite.play("walk")
		else:
			# else flip it
			$AnimatedSprite.flip_h = true
			# check if running, and play animation
			if is_running:
				$AnimatedSprite.play("run")
			else:
				$AnimatedSprite.play("walk")
		
		# changes max speed based on if running or not
		if is_running == true:
			max_speed = run_speed
		else:
			max_speed = walk_speed
			
		# check delta  definition at top of function. keeps speed cosnistent
		# with each physics frame.
		# acc, accelerates the vector to be more than 1.
		motion += input * acc * delta
		# this will not allow character to go past max_speed so it
		# does not accelerate forever
		motion = motion.clamped(max_speed * delta)
	else:
		# change animated sprite node of player to be idle since we are
		# no longer moving
		$AnimatedSprite.play("idle")
		# if no key is currently being pressed, slow down the motion vector to
		# (0, 0) and do it at a rate of friction * delta (delta for consistency).
		# since friction is equal to max speed it should slow down pretty much immediately
		motion = motion.move_toward(Vector2.ZERO, friction * delta)
	
	# all the above code in this function does not move character yet.
	# move_and_collide is a built in Godot function set to the node
	# which this script is attached to (the player object).
	# you can use this function to move the player object based on the
	# motion Vector2 object
	move_and_collide(motion)















