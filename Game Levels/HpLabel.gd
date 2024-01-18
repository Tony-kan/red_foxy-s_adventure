extends Label

#@export var player_path: NodePath
#var Player = get_node(player_path)
#@onready var player = $"../../Player/Player"
@onready var player = $"../../Player/Player"
var player_health = player.Health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(player_health)
	#text = "HP : " + str(player_health)
