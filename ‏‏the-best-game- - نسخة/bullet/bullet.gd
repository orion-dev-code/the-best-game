extends Area2D
#المسافه التي قطعتها الرصاصة
var travelled_distance = 0
 #السرعه
var speed = 300 
 #المسافه
var rangee = 500

func _ready() -> void:
	$Icon.show()
	pass

func _physics_process(delta):
	#اتجاه الرصاصة
	var dir = Vector2.RIGHT.rotated(rotation) 
	
	#تحريك الرصاصة
	position += dir * speed * delta
	 
	#حساب المسافه التي المقطوعة 
	travelled_distance += speed * delta
	
	 # اذا كانت المسافه المقطوعه اكبر من المسافه اذن الرصاصة تختفي  
	if travelled_distance > rangee: 
		queue_free() 

#اذا العدو انضرب في الرصاصة 
func _if_enemy_entered(body): 
	if body.is_in_group("enemy"):
		body.take_damage()
	speed = 0
	$Icon.hide()
	$CPUParticles2D.restart()
	await(get_tree().create_timer(0.5).timeout)
	 #الرصاصة تختفي 
	queue_free()
	pass
