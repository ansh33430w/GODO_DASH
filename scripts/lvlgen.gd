extends Node2D




@export var playerpath :NodePath 
@export var ground_scene :PackedScene

@export var tilewidth = 800.0

var tile_ahed = 4
var despawndistance = 1500.0


var player : Node2D
var spawned_tiles : Array[Node2D] = []
var next_spawntile = 0.0


func _ready() -> void:
	player = get_node(playerpath)
	
	for i in range(tile_ahed):
		_spawntiles()
	
	
	
		
	
	
	
	
	
	
	
@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	if player == null:
		return
	while next_spawntile < player.global_position.x + (tile_ahed * tilewidth):
		_spawntiles()
		
	_despawn_tiles()
	
	
	
	
	

	
func _spawntiles():
	if ground_scene == null :
		return
	var tile : Node2D = ground_scene.instantiate()
	add_child(tile)
	tile.global_position = Vector2(next_spawntile,0.0)
	spawned_tiles.append(tile)
	next_spawntile += tilewidth
	
	
	
	
func _despawn_tiles():
	var cutoff = player.global_position.x - despawndistance
	
	
	for i in range(spawned_tiles.size() -1,-1,-1):
		var tile : Node2D = spawned_tiles[i]
		if tile.global_position.x < cutoff:
			tile.queue_free()
			spawned_tiles.remove_at(i)
	
	



	
	
	
	
	
	
