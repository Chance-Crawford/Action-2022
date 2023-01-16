extends YSort

# the y sort determines which sprites display in front of other sprites depending 
# on the objects anchor point.

# for example if you oprn up the small tree scene and see the static objects anchor 
# point which is a "+" if the character is in front of the + on the small tree
# it will appear in front of the tree, if the player is behind (above) the anchor
# point it will appear behind the tree sprite

# the reason why we put the foreground in front of the y sort is so that 
# we can quickly make the player sprite
# be seen below the tree sprites on the left upper corner going down verically |.
# its like the foreground is a layer above the y sort



