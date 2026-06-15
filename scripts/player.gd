extends CharacterBody2D

@export var speed: float = 300.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	print(global_position)   # temporal
	_actualizar_animacion(direction)

func _actualizar_animacion(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		anim.play("idle")
	else:
		anim.play("walk")
		# girar el sprite segun hacia donde se mueve en horizontal
		if direction.x < 0:
			anim.flip_h = true
		elif direction.x > 0:
			anim.flip_h = false
