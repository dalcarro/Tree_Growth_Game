extends RichTextLabel


func _on_Roots_mouse_entered():
	self.set_text("Cost: 5 Sugar" )

func _on_Trunk_mouse_entered():
	self.set_text("Cost: 50 sugar")

func _on_Branch_mouse_entered():
	self.set_text("Cost: 25 sugar")

func _on_Buds_mouse_entered():
	self.set_text("Cost: 75 sugar")

func _on_Sugar_mouse_entered():
	self.set_text("Cost: 1 mineral & 1 water")

func _on_Caffine_mouse_entered():
	self.set_text("Cost: 1 sugar & 1 mineral")

func _on_Leaf_mouse_entered():
	self.set_text("Cost: 10 sugar")
