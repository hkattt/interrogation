extends "res://scripts/minigames/minigame.gd"

# Player node
@onready var player: Node2D = $Player
# Obstacle scene
@onready var obstacle_scene: PackedScene = preload("res://scenes/minigames/child/rock.tscn")

# Time range for random spawning
const SPAWN_TIME_MIN: float = 1.0
const SPAWN_TIME_MAX: float = 3.0

var spawn_timer: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_timer = randf_range(SPAWN_TIME_MIN, SPAWN_TIME_MAX)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_timer -= delta
	
	# If the timer runs out, spawn an obstacle 
	if spawn_timer <= 0:
		spawn_obstacle()
		spawn_timer = randf_range(SPAWN_TIME_MIN, SPAWN_TIME_MAX)
		
	if player.is_dead():
		lose_game()
		
func spawn_obstacle():
	var obstacle: Area2D = obstacle_scene.instantiate()
	obstacle.position = Vector2(350, 90)
	add_child(obstacle)
