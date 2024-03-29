extends Node

@onready var luces = $"../../../"

#1 stage, 2 dining, 5 west hall, 3 backstage, 4 suplyroom
@onready var stage = $"../stage/AnimatedSprite2D"
@onready var dining = $"../dining/AnimatedSprite2D"
@onready var backStage = $"../BackStage/AnimatedSprite2D"
@onready var suplyRoom = $"../SuplyRoom/AnimatedSprite2D"
@onready var westHallCorner = $"../westHall/AnimatedSprite2D"
@onready var westHall = $"../westHall2/AnimatedSprite2D"
@onready var hora = $"../../../hora"
@onready var oficina = $"../../../Animaciones/oficina"
@onready var lugares:Array = ["stage", "dining","backStage","suplyRoom","westHallCorner","westHall"]
var lugarActual:String = "stage"
var lugarAnterior:String = "stage"
var lugaresBonie:Array = ["stage"]
var horaActual = 1
var enOficina:bool = false
var puertaAbierta:bool = true
var puedeMoverse:bool = true
var luz:bool = false

func Mover(hora:int) -> void:
	if not enOficina:
		var probabilidad:float = (randf_range(0,2) * hora)
		if probabilidad > (lugares.size()-1):
			probabilidad = randi_range(3,5)
		lugarActual = lugares[int(probabilidad)]
		lugarAnterior = lugaresBonie[-1]
		lugaresBonie.append(lugarActual)
		if lugarActual == "westHall":
			Mover_a_Oficina()
			puedeMoverse = false

func Mover_a_Oficina() -> void:
	await get_tree().create_timer(5)
	print("entra oficina")
	enOficina = true
	luces.bonieOficina = true
	ActualizarAnimacion()
	await get_tree().create_timer(3)
	
	if puertaAbierta:
		Jumpscare()

func Moverse() -> void:
	if puedeMoverse:
		Mover(horaActual)
		ActualizarAnimacion()

func Ganaste() -> void:
	print("ganaste")

func Jumpscare():
	pass

func _on_hora_timeout() -> void:
	horaActual += 1
	if horaActual == 7:
		Ganaste()



func ActualizarAnimacion() -> void:
	if lugarActual == "dining":
		match randi_range(0,1):
			0:
				dining.play("bonie")
			1:
				dining.play("bonie2")
	elif lugarActual == "backStage":
		match randi_range(0,1):
			0:
				backStage.play("bonie")
			1:
				backStage.play("bonie2")
	else:
		match lugarActual:
			"stage":
				stage.play("default")
			"suplyRoom":
				suplyRoom.play("bonie")
			"westHallCorner":
				westHallCorner.play("bonie")
			"westHall":
				if enOficina:
					westHall.play("default")
				else:
					westHall.play("bonie")
	match lugarAnterior:
			"stage":
				stage.play("sinBonie")
			"suplyRoom":
				suplyRoom.play("default")
			"westHallCorner":
				westHallCorner.play("default")
			"westHall":
				westHall.play("default")
			"backStage":
				backStage.play("default")
			"dining":
				dining.play("default")


func _on_luz_izq_pressed():
	if not luz:
		luz = true
		if enOficina and luz:
			oficina.play("bonie")
	else:
		luz = false
