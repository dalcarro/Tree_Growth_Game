extends Control

const txt1 = "Welcome to Untitled Tree Game. You are a coffee tree and you objectives is to create as many seeds as possible during your 10 year. You must balance your resources wisely to deal with random events every month after your first January. You grow resource generating roots & leaves to make surgar to grow yourself. You must also create Caffine, a natural pestiside, to fend of insects and parasites."
const txt2 = ""

var indexer = 0
var indexer_proxy = 0
var last_index = 0

const box_arr = [null,"descrip_box","cost_box","build_box",
"stock_box","turn_button","clock_box",
"lives_box","console_box"] 
const text_arr = [txt1]

# 67ff0000   red transparent color (255,0,0,103)

#invisible color 00ff00

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("tut_panel/tut_log").add_text(text_arr[0])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func main():
	
	if box_arr[last_index] != null && box_arr[indexer] != null:
		get_node(box_arr[last_index]).set_frame_color(0)
	else:
		get_node(box_arr[indexer]).set_frame_color(6815488)
		get_node("tut_panel/tut_log").clear()
		get_node("tut_panel/tut_log").add_text(text_arr[indexer])
	
func _on_back_pressed():
	last_index = indexer
	indexer_proxy -= 1
	if indexer_proxy == -1:
		get_tree().change_scene("res://main_menu.tscn")
		yield()
	else:
		indexer -= 1
		main()


func _on_forward_pressed():
	last_index = indexer
	indexer_proxy += 1
	if indexer_proxy == text_arr.size():
		get_tree().change_scene("res://main_menu.tscn")
	else:
		indexer += 1
		main()
