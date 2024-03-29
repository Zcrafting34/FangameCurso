extends Button

var open:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	open = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered() -> void:
	if not open:
		open = true
		Controlador(open)
	else:
		open = false
		Controlador(open)

func Controlador(open) :
	var monitor = get_parent().get_parent().get_child(5).get_child(0)
	var imagen = get_parent().get_parent().get_child(5).get_child(1)
	var animacionMonitor = monitor.get_child(0)
	var mapa = get_parent().get_parent().get_child(5).get_child(2).get_child(0)
	#Esto es para abrir el monitor
	if open:
		monitor.show()
		monitor.get_child(0).play("default")
		get_parent().get_parent().get_child(1).get_child(0).get_child(0).disabled = true
		get_parent().get_parent().get_child(1).get_child(1).get_child(0).disabled = true
		get_parent().get_parent().get_child(0).position.x = -3
		get_parent().get_parent().get_child(0).position.y = 3
		#Esto es para abrir la imagen
		await animacionMonitor.animation_finished
		imagen.show()
		mapa.show()
	else:
		imagen.hide()
		mapa.hide()
		animacionMonitor.play_backwards("default")
		await animacionMonitor.animation_finished
		monitor.hide()
		get_parent().get_parent().get_child(1).get_child(0).get_child(0).disabled = false
		get_parent().get_parent().get_child(1).get_child(1).get_child(0).disabled = false
