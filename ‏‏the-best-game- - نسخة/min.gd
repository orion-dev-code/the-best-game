extends Control


func _ready() -> void:
	if Globale.music ==false:
		$music.playing = false
	if Globale.music == true:
		$music.playing = true
	pass

func _physics_process(delta: float) -> void:
	if Globale.music ==false:
			$sound.hide()
			$mu.show()
	else:
		$mu.hide()
		$sound.show()
	pass
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://lvl/lvl.tscn")



func _on_button_2_pressed() -> void:
	get_tree().quit()


func _on_sound_pressed() -> void:

	Globale.music = false

	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_mu_pressed() -> void:
	Globale.music = true

	get_tree().reload_current_scene()
	pass # Replace with function body.
