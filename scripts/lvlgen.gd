extends Node2D




@export var playerpath :NodePath 
@export var pattern_scene :Array[PackedScene] = []

@export var tilewidth = 800.
var  minbuff = 3
var maxbuff = 8
var despawndis = 1500

var player :Node2D
var spanedtiles = []
var nextspantile_x = 0.0
var cur_buff_target = 0


func _ready() -> void:
	player = get_node(playerpath)
	randomize()
	
	_new_buff_target()
	
	for i in range(cur_buff_target):
		_spawntiles()
		
	
	
	
	
	
	
	
func _physics_process(delta: float) -> void:
	if player == null or pattern_scene.is_empty():
		return
	
	_spawntiles()
	_new_buff_target()
	
	_despan_tiles()
	
	
	
	
	
	
func _new_buff_target():
	cur_buff_target = randi_range(minbuff,minbuff)
	
	
	
func _spawntiles():
	if pattern_scene.is_empty():
		push_warning("no pattern")
		return
		
	var selected :PackedScene = pattern_scene[randi() % pattern_scene.size() ]
	var tile = selected.instantiate()
	add_child(tile)
	tile.global_position = Vector2(nextspantile_x , 0.0)
	spanedtiles.append(tile)
	nextspantile_x += tilewidth
	
	
	
func _despan_tiles() :
	var cutof_x :float =player.global_position.x - despawndis
	
	for i in range(spanedtiles.size() - 1 , - 1 , -1 ):
		var tiles :Node2D = spanedtiles[i]
		if tiles.global_position.x < cutof_x :
			tiles.queue_free()
			spanedtiles.remove_at(i)
		
	
	
	


	
	
	
	
	
	
