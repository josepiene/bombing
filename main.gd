extends Node
@onready var question_label=$BoxContainer/CenterContainer/VBoxContainer/Questionlabel
@onready var answer_list=$BoxContainer/CenterContainer/VBoxContainer/AnswerList
@onready var timer_label=$BoxContainer/CenterContainer/VBoxContainer/TimerQueestion
@onready var timer=$MyTimer
@onready var bomb=$BoxContainer/CenterContainer/VBoxContainer/BOmb
# Called when the node enters the scene tree for the first time.
func _ready():
	QuestionManager.load_questions("res://data/question.json")
	var current_question=QuestionManager.get_current_questions()
	load_question(current_question)
		
func _process(delta):
	var time_left = timer.time_left
	var minutes = int(time_left) / 60
	var seconds = int(time_left) % 60
	timer_label.text = "%02d:%02d" % [minutes, seconds]
func load_question(current_question):
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
		var next_question=QuestionManager.get_next_questions()
		if next_question==null:
			get_tree().change_scene_to_file("res://levels/gameover.tscn") 
		else :
			load_question(next_question)
			timer.stop()
			timer.start()
	else:
		get_tree().change_scene_to_file("res://levels/gameover.tscn") 
	

 
func _on_my_timer_timeout() -> void:
	bomb.play("explode")


func _on_b_omb_animation_finished() -> void:
	var current_played_animation=bomb.animation
	print(current_played_animation)
	if current_played_animation=="explode":
		get_tree().change_scene_to_file("res://levels/gameover.tscn")


func _on_b_omb_animation_looped() -> void:
	var current_played_animation=bomb.animation
	print(current_played_animation)
	if current_played_animation=="explode":
		get_tree().change_scene_to_file("res://levels/gameover.tscn")
