extends CharacterBody2D

const SPEED = 100.0

@onready var timer: Timer = $Timer
var direction: Vector2 = Vector2.ZERO
var random_angle: float

func _ready() -> void:
	rotate_rand()
	timer.start(6)

func _physics_process(delta: float) -> void:
	velocity = direction * SPEED
	move_and_slide()
	for i in get_slide_collision_count():
		print_debug("choque")
		var collision = get_slide_collision(i)
		var collider1 = collision.get_collider()
		if i != 0:
			rotate_rand()

func _on_timer_timeout() -> void:
	rotate_rand()
	timer.wait_time = randf_range(1.0, 6.0)
	timer.start()

func rotate_rand():
	random_angle = randf_range(0.0, TAU)
	rotation = random_angle
	direction = Vector2.RIGHT.rotated(random_angle)
