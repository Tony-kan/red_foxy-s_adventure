extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player = $"../../Player"
var SPEED = 50
var chase = false


func _ready():
	animated_sprite_2d.play("Idle")

func _physics_process(delta):
	#add gravity
	velocity.y += gravity * delta
	if chase == true:
		if animated_sprite_2d.animation != "Death":
			animated_sprite_2d.play("Jump")
		var direction = (player.position - position).normalized()
		if direction.x > 0:
			animated_sprite_2d.flip_h = true
			#velocity.x = direction.x * SPEED
		elif direction.x < 0 :
			animated_sprite_2d.flip_h = false
			#velocity.x = direction.x * SPEED
		velocity.x = direction.x * SPEED
	else:
		if animated_sprite_2d.animation != "Death":
			animated_sprite_2d.play("Idle")
		velocity.x = 0
	move_and_slide()
	


func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true
		print("Player entered ",chase)
	

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false
		print("Player exited ",chase)


func _on_frog_death_body_entered(body):
	if body.name == "Player":
		death()


func _on_damage_player_body_entered(body):
	if body.name == "Player":
		body.health -= 3
		death()
		
func death():
	chase = false
	animated_sprite_2d.play("Death")
	await animated_sprite_2d.animation_finished
	self.queue_free()
