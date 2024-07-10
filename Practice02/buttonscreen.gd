extends Node2D

@export var Bullet: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = $"Timer"
	timer.timeout.connect(timeout)
	var anim = $"MoveAnimate"
	anim.play("PointRight");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var scene = preload("res://bullet.tscn")
	if Input.is_action_just_pressed("ui_select"):
		var bullet = scene.instantiate()
		var tank = $"TankSprite"
		bullet.position =  tank.position
		bullet.rotation = tank.rotation
		add_child(bullet)

func timeout():
	print("time out! ")
	var tank = $"TankSprite"
	tank.visible = not visible
	tank.queue_free()
