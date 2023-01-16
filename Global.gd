extends Node

# script created by going to script tab, file, new script.

# script can be used globally and loaded into any scene. we do this by placing this
# script in project settings, AutoLoad and setting the path to this script.

# global var that we will use to keep track of where the players
# location was when before they entered the room (so we can spawn
# them back when they exit the room)
# initialized to (0,0)
var player_last_pos = Vector2()
