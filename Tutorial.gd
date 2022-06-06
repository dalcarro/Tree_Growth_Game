extends Control

const greeting = "Welcome to Untitled Tree Game. You are a coffee tree and you objectives is to create as many seeds as possible during your 10 year. You must balance your resources wisely to deal with random events every month after your first January. You grow resource generating roots & leaves to make surgar to grow yourself. You must also create Caffine, a natural pestiside, to fend of insects and parasites. \n \n Hover your mouse over UI element to read about what they do."
const stock_box = "This shows the resource you have. on the right side of the /, is the maxium of how many you can have at one time. 1 trunk supports 4 branches. 4 branches supports 4 leaves. 1 leaf supports 1 seed. The amount of leaves determines the cap to how much sugar you can make."
const turn_button = "This is the button that allows you to move on to the next month"
const clock_box = "This keeps track of what month and year it is. The last 3 months of the year is winter. So there is not enough sun to make sugar. January is the month you can build as much as your resouces can produce."
const build_box = "you click these buttons to make tree parks (purple and green) and resources (yellow). you can build as many parts as you can buy in January, but outside January you can only build one tree part at a time. You can make as much caffine and sugar as you want. But you cannot make sugar in winter (last 3 months of the year)."
const cost_box = "This box tells you what something costs to make"
const descrip_box = "this reminds you what each resouce/tree part does"
const console_box = "This is where notifications are displayed. explainations as to why you can't create something or the outcome of a random event."
const lives_box = "This keeps track of your lives. Once it hit zero, you get nothing, you lose, good day sir. This happens when a random event subtracts a resource into the negative."

func _ready():
	get_node("tut_panel/tut_log").add_text(greeting)


func reset():
	$AnimationPlayer.play("RESET")
	get_node("tut_panel/tut_log").clear()
	get_node("tut_panel/tut_log").add_text(greeting)
	
func tut_log(str_in: String):
	get_node("tut_panel/tut_log").add_text(str_in)

func _on_forward_pressed():
	get_tree().change_scene("res://main_menu.tscn")


func _on_console_box_mouse_entered():
	get_node("tut_panel/tut_log").clear()
	$AnimationPlayer.play("console_box_red")
	tut_log(console_box)


func _on_console_box_mouse_exited():
	reset()


func _on_lives_box_mouse_entered():
	get_node("tut_panel/tut_log").clear()
	$AnimationPlayer.play("lives_box_red")
	tut_log(lives_box)


func _on_lives_box_mouse_exited():
	reset()


func _on_clock_box_mouse_entered():
	get_node("tut_panel/tut_log").clear()
	$AnimationPlayer.play("clock_box_red")
	tut_log(clock_box)


func _on_turn_button_mouse_entered():
	get_node("tut_panel/tut_log").clear()
	$AnimationPlayer.play("turn_button_red")
	tut_log(turn_button)


func _on_turn_button_mouse_exited():
	reset()


func _on_stock_box_mouse_entered():
	get_node("tut_panel/tut_log").clear()
	$AnimationPlayer.play("stock_box_red")
	tut_log(stock_box)


func _on_stock_box_mouse_exited():
	reset()


func _on_build_box_mouse_entered():
	get_node("tut_panel/tut_log").clear()
	$AnimationPlayer.play("build_box_red")
	tut_log(build_box)


func _on_build_box_mouse_exited():
	reset()


func _on_cost_box_mouse_entered():
	get_node("tut_panel/tut_log").clear()
	$AnimationPlayer.play("cost_box_red")
	tut_log(cost_box)


func _on_cost_box_mouse_exited():
	reset()


func _on_descrip_box_mouse_entered():
	get_node("tut_panel/tut_log").clear()
	$AnimationPlayer.play("descrip_box_red")
	tut_log(descrip_box)


func _on_descrip_box_mouse_exited():
	reset()

func _on_clock_box_mouse_exited():
	reset()
