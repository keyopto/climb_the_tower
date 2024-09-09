extends CanvasLayer

signal timer_start_finish

@export var default_time_to_take: int = 2
@export var time_to_vanish: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	$TimerLabel.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_timer(time_to_take = default_time_to_take):	
	var length_animation = $AnimationPlayer.get_animation("timer").length
	var new_speed_animation = length_animation / time_to_take
	
	$TimerLabel.show()
	
	$AnimationPlayer.play("timer", -1, new_speed_animation, false)
	
	await get_tree().create_timer(time_to_take).timeout
	
	timer_start_finish.emit()
	
	await get_tree().create_timer(time_to_vanish).timeout
	
	$TimerLabel.hide()
