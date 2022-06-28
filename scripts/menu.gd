extends Control
class_name Menu

onready var v_container: VBoxContainer = get_node("VContainer")

func _ready() -> void:
	for button in v_container.get_children():
		button.connect("pressed", self, "on_button_pressed", [button.name])
		
		
func on_button_pressed(button_name: String) -> void:
	match button_name:
		"NewGame":
			var _change_scene: bool = get_tree().change_scene("res://scenes/levels/level_1.tscn")
			
		"LevelSelector":
			var _change_scene: bool = get_tree().change_scene("res://scenes/level_selector.tscn")
			
		"Quit":
			get_tree().quit()
