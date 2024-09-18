extends Control




func _on_resume_pressed() -> void:
	Globale.pause_menu = false
	pass # Replace with function body.


func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://min.tscn")
	pass # Replace with function body.
