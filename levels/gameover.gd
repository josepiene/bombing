extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	QuestionManager.reset_question()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ReturnToMainMenu_press() -> void:
	get_tree().change_scene_to_file("res://levels/main_menu.tscn") 


func _on_QuitGame_press() -> void:
	get_tree().quit() 
