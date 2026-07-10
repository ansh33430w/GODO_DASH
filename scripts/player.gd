extends  CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D




var gravity = 2500.0
var jumpvelocity = -800.0
var maxfallspeed = 16000.0

var playerspeed = 400.0

var cur_jumps = 0
var maxjumps = 2

var cur_state :state = state.IDLE



enum state {
	IDLE,RUN,D_JUMP,FALL,JUMP
}

var states = state.IDLE




func _physics_process(delta: float) -> void:
	Gravity(delta)
	jump()
	velocity.x = playerspeed
	move_and_slide()
	
	var next_state = nextstate()
	if next_state != cur_state:
		statechanger(next_state)
		
	rotation_update(delta)
	
	
	
	
	
	
	
	
	
	
	
	
	
func Gravity(delta) :
	if not is_on_floor():
		velocity.y += gravity*delta
		velocity.y = min(velocity.y,maxfallspeed)
	else:
		cur_jumps = 0
		velocity.y = 0
	
		
		
		

func jump() :
	if Input.is_action_just_pressed("ui_accept") and cur_jumps < maxjumps :
		velocity.y = jumpvelocity
		cur_jumps +=1
	
		
		
		
		
		
func nextstate() -> state:
	var ground :bool= is_on_floor()
	var iniar :bool= velocity.y < 0.0
	
	match [ground,iniar]:
		[true, _]:
			return state.RUN  if abs(velocity.x)>0.0 else state.IDLE
		[false,true]:
			return state.D_JUMP if cur_jumps >=2 else state.JUMP
		[false,false]:
			return state.FALL
		_:
			return cur_state
			
			
			
func statechanger(newstate:state) :
	cur_state = newstate
	statemanager(newstate)
	
	
	
func statemanager(State:state):
	var anim : String
	
	match State:
		state.IDLE :
			anim = "idle"
			
		state.RUN:
			anim = "neonorm"
			
		state.JUMP:
			anim = "jump"
			
		state.D_JUMP:
			anim="doublejump"
			
		state.FALL:
			anim = "fall"
		_:
			anim = "idle"

		
	if animated_sprite_2d.animation !=anim :
		animated_sprite_2d.play(anim)
		
		



func rotation_update(delta) :
	if not is_on_floor() :
		animated_sprite_2d.rotation += deg_to_rad(360.0) * delta *1.5
	else:
		animated_sprite_2d.rotation =0.0
		
		
		
		
		
		
		
func die() :
	get_tree().reload_current_scene()
