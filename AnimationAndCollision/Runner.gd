extends Area2D
signal hit
@export var speed = 400
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size 
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$RunnerSprite.play()
	else:
		$RunnerSprite.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func _on_body_entered(body):
	hide()
	hit.emit()
	$RunnerCollide.set_deferred("disabled", true)
	$Timer.start()
	 # Replace with function body.

func _on_timer_timeout():
	show()
	$RunnerCollide.disabled = false
	position = Vector2(400, 400) 
# Replace with function body.
