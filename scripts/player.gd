extends Area2D

var cur_climb_animation = "";

func _ready():
	$AnimationPlayer.play("idle")

func _process(delta):
	pass
	
func prepare_start_of_game():
	$AnimationPlayer.play("turn_over")
	
func next_climb():
	if (cur_climb_animation == "climb_right"):
		cur_climb_animation = "climb_left"
	else:
		cur_climb_animation = "climb_right"
	
	$AnimationPlayer.play(cur_climb_animation)
