extends KinematicBody2D

const acc = 25
const max_speed = 80
const friction = 80

# vector2 holds the coordinate of your object on the map
# since it is vector2 and not vector3 this is in reference to (x, y)
# of player
var motion = Vector2
