extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_button_pressed():
	start_game.emit()
	$StartButton.hide()

func update_height(height):
	$CurrentHeightLabel.text = str(height)
