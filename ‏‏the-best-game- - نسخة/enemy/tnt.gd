
extends CharacterBody2D


var speed = 90 

#مشهد اللاعب 
@onready var player = get_node("/root/lvl/player") 

func  _ready() -> void:

	$Area2D/CollisionShape2D.disabled = false
	speed = 90
	pass

func _physics_process(delta):
	move()
	pass



func move():
	#العدو يتبع الاعب 
	var dir = global_position.direction_to(Globale.global_pos) 
	
	 #تحريك العدو
	velocity = dir * speed
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimationPlayer.play("explosion")
		$Area2D/CollisionShape2D.disabled = true
		speed = 0
		await (get_tree().create_timer(1.7).timeout)
		queue_free()
	pass # Replace with function body.


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globale.health -= 50
	pass # Replace with function body.
