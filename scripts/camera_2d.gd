extends Camera2D

var pow = 60.0
var fade = 30.0

var cur_shake : = 0.0

func shake():
	cur_shake = pow
	
	
	
func _process(delta: float) -> void:
	if cur_shake>0:
		cur_shake = lerp(cur_shake , 0.0 ,fade * delta)
		
		offset = Vector2(randf_range(-cur_shake,cur_shake),randf_range(-cur_shake,cur_shake))
	else:
		offset=Vector2.ZERO
		 
