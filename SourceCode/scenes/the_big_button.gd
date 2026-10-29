extends TextureButton

@export var console: RichTextLabel

const COLORE_NORMALE := Color.WHITE
const COLORE_HOVER := Color(1.0, 0.9, 0.9)
const COLORE_PREMUTO := Color(0.75, 0.75, 0.75)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_pressed)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)

	scrivi_console("Plancia pronta.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_mouse_entered() -> void:
	self_modulate = COLORE_HOVER


func _on_mouse_exited() -> void:
	self_modulate = COLORE_NORMALE


func _on_button_down() -> void:
	self_modulate = COLORE_PREMUTO


func _on_button_up() -> void:
	self_modulate = (
		COLORE_HOVER if is_hovered() else COLORE_NORMALE
	)


func _on_pressed() -> void:
	scrivi_console("Pulsante di emergenza premuto!")
	

func scrivi_console(messaggio: String) -> void:
	#print(messaggio)

	if is_instance_valid(console):
		console.add_text(messaggio + "\n")
