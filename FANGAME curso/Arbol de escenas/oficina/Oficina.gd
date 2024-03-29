extends Node2D
#variables para control
var izq:bool = false
var der:bool = false
var puertaIzq:bool = false
var puertaDer:bool = false
#luces
var luzIzq:bool = false
var luzDer:bool = false

var bonieOficina:bool = false

func _ready():
	$Audios/llamada.play()
	$Audios/ambiente.play()
	
	$Animaciones/ventilador.play("default")
	
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movCamara(izq,der)
	puertas()
	pass



func movCamara(izq:bool, der:bool):
	if izq && $Camara.position.x > -229:
		$Camara.position.x -= 20
	if der && $Camara.position.x < 219:
		$Camara.position.x += 20

func _on_izq_mouse_entered():
	izq = true
	print("izq true")
	pass
func _on_izq_mouse_exited():
	izq = false
	print("izq false")
	pass
func _on_der_mouse_entered():
	der = true
	pass 
func _on_der_mouse_exited():
	der = false
	pass




func _on_boton_izq_pressed():
	$Audios/puerta.play()
	if not puertaIzq:
		$botones/btnIzq.play("puerta")
		$Animaciones/puertaIzq.play("default")
		puertaIzq = true
	else:
		$botones/btnIzq.play("apagado")
		$Animaciones/puertaIzq.play_backwards("default")
		puertaIzq = false
	pass 


func _on_boton_der_pressed():
	$Audios/puerta.play()
	if not puertaDer:
		$botones/btnDer.play("puerta")
		$Animaciones/puertaDer.play("default")
		puertaDer = true
	else:
		$botones/btnDer.play("apagado")
		$Animaciones/puertaDer.play_backwards("default")
		puertaDer = false
	pass




func _on_luz_izq_pressed():
	if not luzIzq:
		luzIzq = true
	else:
		luzIzq = false
		$Animaciones/oficina.play("oficina")
	pass


func _on_luz_der_pressed():
	if not luzDer:
		luzDer = true
	else:
		luzDer = false
		$Animaciones/oficina.play("oficina")
	pass

func puertas() -> void:
	#izq
	if luzIzq and puertaIzq:
		$botones/btnIzq.play("ambos")
		if not bonieOficina:
			$Animaciones/oficina.play("luzIzq")
		await get_tree().create_timer(.5).timeout
		$Animaciones/oficina.stop()
	elif luzIzq:
		$botones/btnIzq.play("luz")
		if not bonieOficina:
			$Animaciones/oficina.play("luzIzq")
		await get_tree().create_timer(.5).timeout
		$Animaciones/oficina.stop()
	elif puertaIzq:
		$botones/btnIzq.play("puerta")
		
	#der
	if luzDer and puertaDer:
		$botones/btnDer.play("ambos")
		$Animaciones/oficina.play("luzDer")
		await get_tree().create_timer(.5).timeout
		$Animaciones/oficina.stop()
	elif luzDer:
		$botones/btnDer.play("luz")
		$Animaciones/oficina.play("luzDer")
		await get_tree().create_timer(.5).timeout
		$Animaciones/oficina.stop()
	elif puertaDer:
		$botones/btnDer.play("puerta")
