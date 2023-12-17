extends Node2D

var current_chosen_letter:Key;
var current_height:int

func _ready():
	current_height = 0

func _process(delta):
	pass

func choose_random_letter():
	var key_expected = randi_range(KEY_A, KEY_Z)
	var letter = char(key_expected - KEY_A + "a".unicode_at(0))
	$KeyRequested.text = letter;
	current_chosen_letter = key_expected
	
func is_event_letter_pressed(event) -> bool:
	return event is InputEventKey \
		and event.pressed \
		and event.key_label >= KEY_A \
		and event.key_label <= KEY_Z;

func on_correct_answer():
	$Player.next_climb()
	choose_random_letter()
	current_height += 1
	$HUD.update_height(current_height)

func _unhandled_input(event):
	if is_event_letter_pressed(event):
		if(event.key_label == current_chosen_letter):
			on_correct_answer()


func _on_hud_start_game():
	$Player.prepare_start_of_game()
	
	await get_tree().create_timer(4.0).timeout
	choose_random_letter()
