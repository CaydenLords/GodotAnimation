extends CharacterBody2D
var screen_size
@export var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
 # Replace with function body.
	screen_size = get_viewport_rect().size 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	var target = $"../Runner"
	if target.position.x >= position.x:
		velocity.x += 1
	else:
		velocity.x -= 1
	if target.position.y >= position.y:
		velocity.y += 1
	else:
		velocity.y -= 1		
	velocity = velocity * speed
	if target.is_visible() == true:
		position += velocity * delta
		$ChaserSprite.play()
	position = position.clamp(Vector2.ZERO, screen_size)

