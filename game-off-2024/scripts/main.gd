extends Node2D

enum Character {
	CHILD,
	CHEF,
	SCIENTIST,
	DOCTOR,
	ARTIST
}

@onready var interview_scene: PackedScene = preload("res://scenes/interview.tscn")
@onready var dialogue_manager: Node2D = $DialogueManager

var character: Character = Character.DOCTOR

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	instantiate_interview(character)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if has_node("Interview"):
		var interview: Node2D = get_node("Interview")
		
		if interview.is_over():
			interview.free()
			dialogue_manager.next_character()
			# TODO: character = next_character(character)
			instantiate_interview(character)

func instantiate_interview(character: Character):
	# Path to character scene and minigame scene
	var character_scene_path: String = character_scene_path(character)
	var character_minigame_scene_path: String  = character_minigame_scene_path(character)
	
	# Create an instance of the minigame scene
	var interview: Node2D = interview_scene.instantiate()
	# Rename the node
	interview.name = "Interview"
	
	interview.set_character(character_scene_path)
	interview.set_minigame(character_minigame_scene_path)
	add_child(interview)

func character_to_string(character: Character) -> String:
	match character:
		Character.CHILD:     return "child"
		Character.CHEF:      return "chef"
		Character.SCIENTIST: return "scientist"
		Character.DOCTOR:    return "doctor" 
		Character.ARTIST:    return "artist"
		_:                   return ""
		
func character_to_index(character: Character) -> int:
	match character:
		Character.CHILD:     return 0
		Character.CHEF:      return 1
		Character.SCIENTIST: return 2
		Character.DOCTOR:    return 3
		Character.ARTIST:    return 4
		_:                   return -1
	
func character_scene_path(character: Character) -> String:
	var character_string: String = character_to_string(character)
	return "res://scenes/minigames/" + character_string + "/" + character_string + ".tscn"
	
func character_minigame_scene_path(character: Character) -> String:
	var character_string: String = character_to_string(character)
	return "res://scenes/minigames/" + character_string + "/" + character_string + "_minigame.tscn"
