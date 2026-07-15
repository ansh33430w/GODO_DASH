extends Node

var score = 0 
var highscore = 0
const savepath = 'user://save.cfg'

func _ready() -> void:
	
	loaddata()


func loaddata():
	var config = ConfigFile.new()
	
	if config.load(savepath) == OK :
		highscore = config.get_value("score","highscore",0)
		
		
func save():
	var config = ConfigFile.new()
	
	config.set_value("score","highscore",highscore)
	config.save(savepath)
	
		
