extends Node
class_name GlobalData

var stars_count: int
var max_stars_value: int

var levels_data: Dictionary = {
	1: [
		"res://scenes/levels/level_1.tscn",  #Path
		true,                                                      #Level Unlocked
		true,                                                      #Level Completed
		true                                                       #Level Starred
	],
	
	2: [
		"res://scenes/levels/level_2.tscn",
		true,
		true,
		false
	],
	
	3: [
		"res://scenes/levels/level_3.tscn",
		true,
		false,
		false
	],
	
	4: [
		"res://scenes/levels/level_4.tscn",
		false,
		false,
		false
	],
	
	5: [
		"res://scenes/levels/level_5.tscn",
		false,
		false,
		false
	],
	
	6: [
		"res://scenes/levels/level_6.tscn",
		false,
		false,
		false
	],
	
	7: [
		"res://scenes/levels/level_7.tscn",
		false,
		false,
		false
	],
	
	8: [
		"res://scenes/levels/level_8.tscn",
		false,
		false,
		false
	],
	
	9: [
		"res://scenes/levels/level_9.tscn",
		false,
		false,
		false
	]
}

func _ready() -> void:
	read_dict()
	print("Estrelas Adquiridas: " + str(stars_count))
	print("Quantidade total de Estrelas: " + str(max_stars_value) + "\n")
	
	
func read_dict() -> void:
	for key in levels_data.keys():
		max_stars_value += 1
		if levels_data[key][3]:
			stars_count += 1
