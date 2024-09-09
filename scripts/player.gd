extends Area2D

var cur_climb_animation = "";

func _ready():
	$AnimationPlayer.play("idle")

func _process(delta):
	pass
	
func prepare_start_of_game(time_to_take):
	var length_animation = $AnimationPlayer.get_animation("turn_over").length
	var new_speed_animation = length_animation / time_to_take
	
	$AnimationPlayer.play("turn_over", -1, new_speed_animation, false)
	
func next_climb():
	if (cur_climb_animation == "climb_right"):
		cur_climb_animation = "climb_left"
	else:
		cur_climb_animation = "climb_right"
	
	$AnimationPlayer.play(cur_climb_animation)
