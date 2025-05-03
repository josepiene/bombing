extends Node
@onready var question_label=$BoxContainer/CenterContainer/VBoxContainer/Questionlabel
@onready var answer_list=$BoxContainer/CenterContainer/VBoxContainer/AnswerList

# Called when the node enters the scene tree for the first time.
func _ready():
	QuestionManager.load_questions("res://data/question.json")
	var current_question=QuestionManager.get_current_questions()
	print("qn:",str(current_question))
	question_label.text=str(current_question["question"])
	for child in answer_list.get_children():
		child.queue_free()
	for index in current_question["answers"].size():
		var button=Button.new()
		var answer=current_question["answers"][index]
		button.name=(str(index))
		button.text=answer
		button.pressed.connect(on_answer_selected.bind(index))
		answer_list.add_child(button)
func on_answer_selected(selected_index):
	var current_question=QuestionManager.get_current_questions()
	var correct_index=current_question["correct_index"]
	if selected_index==correct_index:
		print("correct")
	else:
		print("incorrect")
	

 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
