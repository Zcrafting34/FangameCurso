extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hola mundo, mi primer programa en gdscript")
	$estatica.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):                            
	pass





func _on_new_game_mouse_entered():
	$Set.show()
func _on_new_game_mouse_exited():
	$Set.hide()
func _on_continue_mouse_entered():
	$Set2.show()
func _on_continue_mouse_exited():
	$Set2.hide()



func _on_continue_pressed():
	get_tree().change_scene_to_file("res://Arbol de escenas/menuCarga/menu_carga.tscn")


func _on_tiempo_timeout():
	$animaciones.play("movimiento")
