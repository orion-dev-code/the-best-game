extends CharacterBody2D
#اشاره الحصه استنفذت 
signal health_depleted

var speed = 150



func _physics_process(delta):
	%ProgressBar.value = Globale.health
	Globale.global_pos = global_position
	move()
	hurt(delta)
	pass


func move():
	#التحريك سهل ما حاجه اشرح (=
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction * speed
	if velocity == Vector2(0,0):
		print("he is play idel animation")
	else :
		print("he is play move animation")
	move_and_slide()
	pass

#دمج اللاعب 
func hurt(delta):
	
	#ثابت الدمج
	const DAMAGE = 20.0
	#معرفه عدد الاعداء الذين دخلوا ل صندوق الدمج 
	var overlapping_mobs = %hurt_box.get_overlapping_bodies()
	
	#اذا كان عدد الاعداء الذين دخلوا الى صندوق الدمج اكثر من صفر 
	if overlapping_mobs.size() > 0:
		
		# يتم طرح من صحه اللاعب , ثابت الدمج مضروب في عدد الاعداء الذين دخلوا الى صندوق مضرب في دلتا 
		Globale.health -= DAMAGE * overlapping_mobs.size() * delta
		
		#اضهار صحه اللاعب 
		
		

	pass
