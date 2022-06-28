extends Control
class_name LevelSelector

onready var star_text: Label = get_node("HContainer/StarContainer/Background/Text")
onready var h_container: HBoxContainer = get_node("ScrollList/HContainer")

func _ready() -> void:
	initial_configuration()
	for button in get_tree().get_nodes_in_group("Button"):
		button.connect("pressed", self, "on_button_pressed", [button.name])
		
		
func initial_configuration() -> void:
	star_text.text = str(Global.stars_count) + "/" + str(Global.max_stars_value)
	for container in h_container.get_children():
		var container_index: int = container.get_index()
		var container_button: Button = container.get_child(0)
		var container_label: Label = container_button.get_child(0)
		
		var container_level_data: Array = Global.levels_data[container_index + 1]
		if container_level_data[1] == false:
			container_button.text = "?"
			
		if container_level_data[2] and container_level_data[3]:
			container_label.text = "T T"
		elif container_level_data[2]:
			container_label.text = "T F"
		else:
			container_label.text = "F F"
			
			
func on_button_pressed(button_name: String) -> void:
	if button_name == "Menu":
		var _change_level: bool = get_tree().change_scene("res://scenes/menu.tscn")
		return
		
	var level_info: Array = Global.levels_data[int(button_name)]
	if level_info[1]:
		print("Mudar para o nível: " + button_name + "\n")
		var _change_level: bool = get_tree().change_scene(level_info[0])
	else:
		print("Nível bloqueado!\n")
