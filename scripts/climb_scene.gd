extends Node2D

var current_chosen_letter:Key;

# Called when the node enters the scene tree for the first time.
func _ready():
	current_chosen_letter = choose_random_letter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func choose_random_letter() -> Key:	
	var key_expected = randi_range(KEY_A, KEY_Z)
	var letter = char(key_expected - KEY_A + "a".unicode_at(0))
	$KeyRequested.text = letter;
	return key_expected
	
func is_event_letter_pressed(event) -> bool:
	return event is InputEventKey \
		and event.pressed \
		and event.key_label >= KEY_A \
		and event.key_label <= KEY_Z;

func _unhandled_input(event):
	if is_event_letter_pressed(event):
		if(event.key_label == current_chosen_letter):
			current_chosen_letter = choose_random_letter()
