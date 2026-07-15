extends Node2D


@export var playerpath: NodePath
@export var spikescene :PackedScene

var mingap = 350
var maxgap = 900
var minspike = 3
var maxspike = 7
var despawndistance = 1500.0
var spike_y_level = 0.0

var player : Node2D
var spawned_spike : Array[Node2D] = []
var nextspawn = 0.0
var cur_spike : int = 0


func _ready() -> void:
	player = get_node(playerpath)
	randomize(
		
	)
	_changespiketarget()
	nextspawn = player.global_position.x + 600.0
	for i in range(cur_spike):
		_spawn_spike()
		
		
		
func _process(delta: float) -> void:
	if player == null or spikescene == null :
		return
	while spawned_spike.size() < cur_spike:
		_spawn_spike()
	_despawnspike()
		





func _changespiketarget():
	cur_spike = randf_range(minspike,maxspike)
	
	


func _spawn_spike():
	print("spawnned")
	var spike :Node2D = spikescene.instantiate()
	add_child(spike)
	spike.global_position = Vector2(nextspawn,spike_y_level)
	
	spawned_spike.append(spike)
	nextspawn += randf_range(mingap,maxgap)
	
	
func _despawnspike():
	var cutoff : float = player.global_position.x - despawndistance
	
	for i in range(spawned_spike.size() -1 , -1 ,-1 ):
		var spike : Node2D = spawned_spike[i]
		if spike.global_position.x < cutoff :
			spike.queue_free()
			spawned_spike.remove_at(i)
