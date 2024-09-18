extends CharacterBody2D

var health = 2
var speed = 90 

#مشهد اللاعب 
@onready var player = get_node("/root/lvl/player") 

func  _ready() -> void:
	$Icon.show()
	$CollisionShape2D.disabled = false
	speed = 90
	pass

func _physics_process(delta):
	move()
	pass



func move():
	#العدو يتبع الاعب 
	var dir = global_position.direction_to(player.global_position) 
	
	 #تحريك العدو
	velocity = dir * speed
	move_and_slide()

func take_damage():
	health -= 1
	if health == 0:
		$Icon.hide()
		speed = 0
		$CollisionShape2D.disabled = true
		$CPUParticles2D.restart()
		$explosion.play()
		await(get_tree().create_timer(0.2).timeout)
		queue_free()
