extends Node
var questions =[]
func load_questions(file_path):
	var file=FileAccess.open(file_path,FileAccess.READ)
	questions=JSON.parse_string(file.get_as_text())
	file.close()
