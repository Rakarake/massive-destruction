extends Area3D

@export var health := 3
var _mouse_hovering := false

@onready var _anim_player := $AnimationPlayer
@onready var _hit_sound := $HitSound

func _ready() -> void:
	_anim_player.play("RESET")

func _mouse_enter() -> void:
	_mouse_hovering = true

func _process(_delta: float) -> void:
	if _mouse_hovering && Input.is_action_just_pressed("hit"):
		print("ouch!")
		health -= 1
		_hit_sound.pitch_scale = randf() + 0.3
		_anim_player.stop()
		_anim_player.play("hit")
	if health <= 0:
		await get_tree().create_timer(2).timeout
		queue_free()
