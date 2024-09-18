extends CanvasLayer



func _on_button_pressed():
	# ما حاجه اشرح (= 
	Globale.die = false
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://lvl/lvl.tscn")

	pass # Replace with function body.
