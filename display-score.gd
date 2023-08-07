extends CharacterBody2D

var speed = 200
var score = 0
var score_label

func _ready():
	score_label = get_parent().get_node("Label")
	score = 0

func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		score += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		score += 1
		
	velocity = velocity.normalized() * speed
	move_and_collide(velocity * delta)
	
	score_label.text = "Score: " + str(score)
	
	
