extends Node2D

@onready var child_button: TextureButton     = $MarginContainer/VBoxContainer/TopHBoxContainer/ChildVBoxContainer/ChildButton
@onready var doctor_button: TextureButton    = $MarginContainer/VBoxContainer/TopHBoxContainer/DoctorVBoxContainer/DoctorButton
@onready var chef_button: TextureButton      = $MarginContainer/VBoxContainer/BottomHBoxContainer/ChefVBoxContainer/ChefButton
@onready var scientist_button: TextureButton = $MarginContainer/VBoxContainer/BottomHBoxContainer/ComputerScientistVBoxContainer/CompurterScientistButton

const victory_scene: PackedScene = preload("res://scenes/victory.tscn")
const lose_scene: PackedScene    = preload("res://scenes/lose.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_button_scale(child_button)
	set_button_scale(doctor_button)
	set_button_scale(chef_button)
	set_button_scale(scientist_button)

func set_button_scale(button: TextureButton) -> void:
	if button.is_hovered():
		button.scale = Vector2(1.1, 1.1)
	else:
		button.scale = Vector2(1, 1)

func _on_child_button_button_up() -> void:
	get_tree().change_scene_to_packed(lose_scene)
	SoundManager.play_sound(SoundManager.Sound.CLICK, 20.0)	

func _on_doctor_button_button_up() -> void:
	get_tree().change_scene_to_packed(victory_scene)
	SoundManager.play_sound(SoundManager.Sound.CLICK, 20.0)

func _on_chef_button_button_up() -> void:
	get_tree().change_scene_to_packed(lose_scene)
	SoundManager.play_sound(SoundManager.Sound.CLICK, 20.0)

func _on_scientist_button_button_up() -> void:
	get_tree().change_scene_to_packed(lose_scene)
	SoundManager.play_sound(SoundManager.Sound.CLICK, 20.0)
