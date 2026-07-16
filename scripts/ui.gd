extends CanvasLayer


func _ready() -> void:
	$Label.text = "HIGHSCORE : %d" % Savmanager.highscore
	$Label3.text = "DEATHS %d" % Savmanager.death


	
func _process(delta: float) -> void:
	$Label2.text = "SCORE : %d" % Savmanager.score
