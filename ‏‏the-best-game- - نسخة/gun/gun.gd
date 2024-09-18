extends Area2D



func _physics_process(delta):
	#معرفه اذا دخل العدو الى الايريى او لا
	var enemy_in_range = get_overlapping_bodies()
	
	#اذا كان عدد الاعداء اكثر من صفر
	if enemy_in_range.size() > 0 :
		
		#العدو المستهدف = العدو الذس في المقدمه(الاقرب)
		var target_enemy = enemy_in_range.front()
		
		#انضر ال العدو الاقرب
		look_at(target_enemy.global_position)


func shoot():
	#مشهد الرصاصة
	var bullet_scene = preload("res://bullet/bullet.tscn")
	var bullet = bullet_scene.instantiate()
	
	#موضع الرصاصة = موضع نقطه الاطلاق
	bullet.global_position = %shooting_point.global_position
	
	#زاويه الرصاصة = زاويه نقطه الاطلاق
	bullet.global_rotation = %shooting_point.global_rotation
	
	#اضافه الرصاصة ك ابن ل نقطه الاطلاق
	%shooting_point.add_child(bullet)


# كولداون للرصاصة 
#اذ انتهى وقت تايرم الكولداون 
func _on_bullet_colddown_timeout():
	
	# معرفه عدد الاعداء 
	var enemy_in_range = get_overlapping_bodies()
	
	#اذا كان عدد الاعداء في الجوار اقل من صفر اذن اطلق النار
	if enemy_in_range.size() > 0:
		$shoot.play()
		shoot()
	pass # Replace with function body.
