extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Roots_mouse_entered(): 
	self.set_text("Generates minerals and water every turn")

func _on_Trunk_mouse_entered():
	self.set_text("Increases Branch Cap")

func _on_Branch_mouse_entered():
	self.set_text("Increases Leaf Cap")

func _on_Leaf_mouse_entered():
	self.set_text("Generates sun")

func _on_Buds_mouse_entered():
	self.set_text("Generates minerals and water every turn")

func _on_Water_mouse_entered():
	self.set_text("Generates minerals and water every turn")

func _on_Minerals_mouse_entered():
	self.set_text("Generates minerals and water every turn")

func _on_Sugar_mouse_entered():
	self.set_text("Generates minerals and water every turn")

func _on_Caffine_mouse_entered():
	self.set_text("Generates minerals and water every turn")
