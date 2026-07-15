extends CanvasLayer


func _ready() -> void:
	$Label.text = "HIGHSCORE : %d" % Savmanager.highscore
	


	
func _process(delta: float) -> void:
	$Label2.text = "SCORE : %d" % Savmanager.score
