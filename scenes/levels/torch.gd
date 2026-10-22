extends Node2D
class_name ObjetoGirando

var speed: float = 400.0
var angular_speed: float = PI
var moviendo: bool = false
@onready var timer: Timer = $Timer

func _process(delta: float) -> void:
	if not moviendo:
		return
	rotation += angular_speed * delta
	var velocity := Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _on_timer_timeout() -> void:
	visible = not visible

func _on_button_pressed() -> void:
	moviendo = not moviendo
	if moviendo:
		timer.start()
	else:
		timer.stop()
		visible = true
