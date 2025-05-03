extends Node
var questions =[]
var current_question_index=0
func load_questions(file_path):
	var file=FileAccess.open(file_path,FileAccess.READ)
	questions=JSON.parse_string(file.get_as_text())
	file.close()
	
func get_current_questions():
	return questions[current_question_index]
