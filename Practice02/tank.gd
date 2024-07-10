extends Sprite2D

var speed = 100
var angular_speed = PI

func _init():
	print("The program is working.")


func _process(delta):
	var anim = $"TankAnimate"
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1
	rotation += angular_speed * direction * delta
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
		anim.play("TankMove")
	else:
		anim.stop()
	position += velocity * delta
	


func _on_button_pressed():
	set_process(not is_processing())
# Replace with function body.


