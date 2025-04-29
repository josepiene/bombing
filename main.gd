extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	QuestionManager.load_questions("res://data/question.json")
	print("qn:",str(QuestionManager.questions[0]))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
