extends KinematicBody2D

const SPEED = 64

func _process(delta):
	var movement_input = movement_input()		
	determine_animation(movement_input)
	play_animation(movement_input)
	move_and_slide(movement_input * SPEED).normalized()
	
func movement_input():
	var velocity = Vector2.ZERO
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return velocity

func determine_animation(velocity: Vector2):
	if velocity.x > 0:
		$AnimatedSprite.animation = "right"
	elif velocity.x < 0:
		$AnimatedSprite.animation = "left"
	elif velocity.y > 0:
		$AnimatedSprite.animation = "down"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "up"

func play_animation(velocity: Vector2):
	if velocity != Vector2.ZERO:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0
