@tool
extends Control


@onready var map_area = $BG/HBoxContainer/MarginContainer2/Map_Area

@onready var window = $Window

#Estados
@onready var norte = $BG/HBoxContainer/MarginContainer2/Map_Area/Norte
@onready var nordeste = $BG/HBoxContainer/MarginContainer2/Map_Area/Nordeste
@onready var centro = $BG/HBoxContainer/MarginContainer2/Map_Area/Centro
@onready var sudeste = $BG/HBoxContainer/MarginContainer2/Map_Area/Sudeste
@onready var sul = $BG/HBoxContainer/MarginContainer2/Map_Area/Sul

#Botões
@onready var botao_norte = $"BG/HBoxContainer/MarginContainer/TabContainer/Regiâo/CenterContainer/VBoxContainer/Botao_Norte"
@onready var botao_nordeste = $"BG/HBoxContainer/MarginContainer/TabContainer/Regiâo/CenterContainer/VBoxContainer/Botao_Nordeste"
@onready var botao_centro = $"BG/HBoxContainer/MarginContainer/TabContainer/Regiâo/CenterContainer/VBoxContainer/Botao_Centro"
@onready var botao_sudeste = $"BG/HBoxContainer/MarginContainer/TabContainer/Regiâo/CenterContainer/VBoxContainer/Botao_Sudeste"
@onready var botao_sul = $"BG/HBoxContainer/MarginContainer/TabContainer/Regiâo/CenterContainer/VBoxContainer/Botao_Sul"

#
@onready var option_button = $"BG/HBoxContainer/MarginContainer/TabContainer/Parâmetros/MarginContainer/VBoxContainer/Ano/OptionButton"
@onready var label = $Window/ColorRect/Label


## Python iterface

## For it to work on export:
var DIR = OS.get_executable_path().get_base_dir()
#var script_path = ProjectSettings.globalize_path('res://hello.py')
##not working, 
#var script_path = DIR.plus_file("hello.py")
var script_path

var base_color : Color = Color("ffffff")
@export var highlight_color : Color

## valores padrões para evitar erro
var estado = "a"
var install = "b"
var isotope = "c"
var year = "d"

func _ready():
	if !OS.has_feature('standalone'):
		script_path = ProjectSettings.globalize_path("hello.py")


func _on_botao_norte_pressed():
	for child in map_area.get_children():
		child.modulate = base_color
		norte.modulate = highlight_color
		estado = "norte"

func _on_botao_nordeste_pressed():
	for child in map_area.get_children():
		child.modulate = base_color
		nordeste.modulate = highlight_color
		estado = "nordeste"

func _on_botao_centro_pressed():
	for child in map_area.get_children():
		child.modulate = base_color
		centro.modulate = highlight_color
		estado = "centro_oeste"


func _on_botao_sudeste_pressed():
	for child in map_area.get_children():
		child.modulate = base_color
		sudeste.modulate = highlight_color
		estado = "sudeste"


func _on_botao_sul_pressed():
	for child in map_area.get_children():
		child.modulate = base_color
		sul.modulate = highlight_color
		estado = "sul"


#for graphs?
func _on_window_close_requested():
	window.hide()



func _on_button_pressed():
	window.show()
	#label.text = option_button.text
	year = $"BG/HBoxContainer/MarginContainer/TabContainer/Parâmetros/MarginContainer/VBoxContainer/Ano/OptionButton".text
	print(year)
	
	var output = []
	## for export, it would be good to get the pytho path and/or add a dir
	## with the python and envs 
	
	print(OS.execute('python', [script_path, estado, install, isotope, year], output, true))
	print(output)
	$Window/ColorRect/RichTextLabel.text = str(output[0])
	


func _on_option_button_item_selected(index):
	install = $"BG/HBoxContainer/MarginContainer/TabContainer/Parâmetros/MarginContainer/VBoxContainer/Instalacao/OptionButton".get_item_text(index)
	print(install)


func _on_isotope_item_selected(index):
	isotope = $"BG/HBoxContainer/MarginContainer/TabContainer/Parâmetros/MarginContainer/VBoxContainer/Isotopo/Isotope".get_item_text(index)
	print(isotope)
