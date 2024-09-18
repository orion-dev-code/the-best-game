extends Node2D

var minute = false

func  _ready() -> void:
	if Globale.music ==false:
		$music.playing = false
	if Globale.music == true:
		$music.playing = true
	$health_increase_respawn.start()
	$Timer_spawn_enemy.wait_time = 1.6
	$Timer2.wait_time = 3
	$Timer2.start()
	$Timer/Timer.start()
	Globale.health = 100
	Globale.die = false
	Globale.second = 0
	minute = false
	Globale.pause_menu = false
	pass

func _physics_process(delta: float) -> void:

	#pause_menu
	if Globale.pause_menu == true:
		Engine.time_scale = 0
		
		$pause_menu.show()
		
	else:
		$pause_menu.hide()
	#pause_menu
	if Globale.health<=0:
		Globale.die = true
	if Globale.die ==true && Globale.pause_menu == false:
		$die_screen.show()
		Engine.time_scale = 0
	if Globale.die == false && Globale.pause_menu ==false:
		$die_screen.hide()
		Engine.time_scale = 1
	if Globale.minut ==1:
		$Timer_spawn_enemy.wait_time = 1
		$Timer2.wait_time = 2
	if Globale.minut == 2:
		$Timer_spawn_enemy.wait_time = 0.5
		$Timer2.wait_time = 1
	if Globale.second == 60:
		minute = true
		Globale.minut += 1
		Globale.second = 0
	if minute ==false:
		$Timer/Label.text = str(Globale.second)
	if minute ==true :
		$Timer/Label.text = str(Globale.minut)+':'+str(Globale.second)
	pass

func spawn_enemy():
	#مشهد العدو
	var enemy_scene = preload("res://enemy/enemy.tscn")
	var enemy = enemy_scene.instantiate()
	
	#مكان رسبون العدو العشوائي 
	$random_spawn_enemy/PathFollow2D.progress_ratio = randf()
	
	# موضع العدو = موضع رسبون العدو العشوائي
	enemy.global_position = $random_spawn_enemy/PathFollow2D.global_position
	
	#اضافه العدو ك ابن ل مشهد المرحله 
	add_child(enemy)
	pass

func spown_tnt():
	var enemy_tnt = preload("res://enemy/tnt.tscn").instantiate()

	
	#مكان رسبون العدو العشوائي 
	$random_spawn_enemy/PathFollow2D.progress_ratio = randf()
	
	# موضع العدو = موضع رسبون العدو العشوائي
	enemy_tnt.global_position = $random_spawn_enemy/PathFollow2D.global_position
	
	#اضافه العدو ك ابن ل مشهد المرحله 
	add_child(enemy_tnt)
	pass

#عندما ينتهي الوقت الذي في التايمر يتم اضافه عدو الى المرحله 
func _on_timer_spawn_enemy_timeout():
	spawn_enemy()
	pass # Replace with function body.

# اذا تم تفعيل اشاره الصحه استنفذت (اصبحت = صفر) 



func _on_timer_timeout() -> void:
	Globale.second += 1
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	spown_tnt()
	pass # Replace with function body.


func _on_button_pressed() -> void:
	Globale.pause_menu = true
	pass # Replace with function body.


func _on_health_increase_respawn_timeout() -> void:
	var health_increase = preload("res://health_increase.tscn").instantiate()
	health_increase.global_position = Vector2(randi_range(54,438),randi_range(50,230))
	get_parent().add_child(health_increase)
	pass # Replace with function body.
