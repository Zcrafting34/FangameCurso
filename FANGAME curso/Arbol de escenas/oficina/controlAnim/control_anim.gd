extends Node2D

@onready var camaras:Array = [$stage, $dining, $pirateCove, $westHall, $westHall2, $eastHall, $eastHall2,
					$BackStage, $RestRooms, $SuplyRoom]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func CambiarCamara(camara) -> void:
	for i in camaras:
		i.hide()
	camaras[camara].show()

func _on_stage_pressed():
	CambiarCamara(0)


func _on_dinner_pressed():
	CambiarCamara(1)


func _on_pirate_cove_pressed():
	CambiarCamara(2)


func _on_west_hall_pressed():
	CambiarCamara(3)


func _on_west_hall_2_pressed():
	CambiarCamara(4)


func _on_supply_closset_pressed():
	CambiarCamara(9)


func _on_east_hall_pressed():
	CambiarCamara(5)


func _on_east_hall_2_pressed():
	CambiarCamara(6)


func _on_back_stage_pressed():
	CambiarCamara(7)


func _on_kitchen_pressed():
	for i in camaras:
		i.hide()


func _on_rest_rooms_pressed():
	CambiarCamara(8)
