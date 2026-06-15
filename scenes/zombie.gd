extends CharacterBody2D

@export var speed: float = 120.0

var player: Node2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	print("player encontrado: ", player)   # temporal
	$AnimatedSprite2D.play("walk")

func _physics_process(_delta: float) -> void:
	if player == null:
		return
	# direccion hacia el jugador
	var direction := (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
	$AnimatedSprite2D.flip_h = direction.x < 0
