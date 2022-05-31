extends RichTextLabel


func _on_Roots_mouse_entered(): 
	self.set_text("Generates minerals and water every turn")

func _on_Trunk_mouse_entered():
	self.set_text("Increases Branch Cap")

func _on_Branch_mouse_entered():
	self.set_text("Increases Leaf Cap")

func _on_Leaf_mouse_entered():
	self.set_text("Generates sun")

func _on_Buds_mouse_entered():
	self.set_text("Adds 1 to your score pure seed made")

func _on_Sugar_mouse_entered():
	self.set_text("Used to grow tree parts and make Caffine")

func _on_Caffine_mouse_entered():
	self.set_text("Used to repel insects and parasites")
