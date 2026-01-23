extends CharacterBody2D

const SPEED = 45.0
const GRAVITY = 900.0

@onready var animated_sprite_2d = $AnimatedSprite2D

@export var patrol_tiles := 6
@export var tile_size := 32

var start_x := 0.0
var direction := 1

func _ready():
	start_x = global_position.x

func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity.y += GRAVITY * delta

	# basic movement
	velocity.x = SPEED * direction
	var distance = global_position.x - start_x
	var max_distance = patrol_tiles * tile_size
	
	if abs(distance) >= max_distance:
		direction *= -1
		start_x = global_position.x

	update_animation()
	move_and_slide()

func update_animation():
	animated_sprite_2d.play("idle")
	animated_sprite_2d.flip_h = direction < 0


func _on_hitbox_1_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
