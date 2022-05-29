extends Control
const months = ["January","Febuary","March","April","May","June","July","Aguest","September","October","November","December"]
#resource variables
var prod_toggle: bool = true
var month_count: int = 0
var is_january: bool = true
var month_string: String = "January"
var year_number: int = 0

var play_in = {
	"water": 0,
	"minerals": 0,
	"sugar": 200,
	"buds": 0,
	"caff": 0,
	"trunk": 0,
	"branches": 0,
	"roots": 0,
	"leaves": 0
}


# modifiers
var sugar_modifier: int = 0

#structure variables

func _ready():
	update()

func time_iterator():
	if month_count > 11:
		month_count = 0
		year_number += 1
	month_string = months[month_count]
	prod_toggle = true
	if month_count == 0:
		is_january = true
	else:
		is_january = false
	generate_resources()
	update()
		
func con_log(arg_in : String):
	get_node("console/console_log").add_text("\n \t" + arg_in)
	
	
##updates all variables to screen to reflect transactions/changes
func update():
	get_node("Control/Panel/month_year").set_text(month_string + ": Year # " + str(year_number))
	get_node("Stock_Pile/Stock_Panel/resources/Water").set_text("Water: " + str(play_in["water"]))
	get_node("Stock_Pile/Stock_Panel/resources/Sugar").set_text("Sugar: " + str(play_in["sugar"]))
	get_node("Stock_Pile/Stock_Panel/resources/Trunk").set_text("Trunk: " + str(play_in["trunk"]))
	get_node("Stock_Pile/Stock_Panel/resources/Roots").set_text("Roots: " + str(play_in["roots"]))
	get_node("Stock_Pile/Stock_Panel/resources/Buds").set_text("Buds: " + str(play_in["buds"]))
	get_node("Stock_Pile/Stock_Panel/resources/Minerals").set_text("Minerals: " + str(play_in["minerals"]))
	get_node("Stock_Pile/Stock_Panel/resources/Branches").set_text("Branches: " + str(play_in["branches"]))
	get_node("Stock_Pile/Stock_Panel/resources/Leaves").set_text("Leaves: " + str(play_in["leaves"]))
	get_node("Stock_Pile/Stock_Panel/resources/Caffine").set_text("Caffine: " + str(play_in["caff"]))
	

func generate_resources():
	play_in["minerals"] += 5 * play_in["roots"]
	play_in["water"] += 5 * play_in["roots"]
	
func _on_Roots_pressed():
	if play_in["sugar"] >= 5 && prod_toggle == true:
		play_in["sugar"] -= 5
		play_in["roots"] += 1
		if !is_january:
			prod_toggle = false
	update()
	
func _on_Trunk_pressed():
	if play_in["sugar"] >= 50 && prod_toggle == true:
		play_in["sugar"] -= 50
		play_in["trunk"] += 1
		if !is_january:
			prod_toggle = false
	update()

func _on_Branch_pressed():
	if play_in["sugar"] >= 25 && prod_toggle == true:
		play_in["sugar"] -= 25
		play_in["branches"] += 1
		if !is_january:
			prod_toggle = false
	update()


func _on_Leaf_pressed():
	if play_in["sugar"] >= 10 && prod_toggle == true:
		play_in["sugar"] -= 10
		play_in["leaves"] += 1
		if !is_january:
			prod_toggle = false
	update()
	

func _on_Buds_pressed():
	if play_in["sugar"] >= 15 && prod_toggle == true:
		play_in["sugar"] -= 15
		play_in["buds"] += 1
		if !is_january:
			prod_toggle = false
	update()


func _on_Caffine_pressed():
	if play_in["sugar"] >= 1 && play_in["minerals"] >= 1 :
		play_in["sugar"] -= 1
		play_in["minerals"] -= 1
		play_in["caff"] += 1
	update()


func _on_Sugar_pressed():
	if play_in["water"] >= 1 && play_in["minerals"] >= 1 :
		play_in["water"] -= 1
		play_in["minerals"] -= 1
		play_in["sugar"] += 1
	update()


func _on_end_turn_pressed():
	month_count += 1
	time_iterator()

## while true:
##		for	 m in 12:
##			month_string = months[m]
##			if month_string == "January":
##				is_january = true
##			else:
##				is_january = false
##				get_node("Control/Panel/month_year").set_text(month_string + ": Year # " + str(year_number))
##				yield()
##		year_number += 1
##		get_node("Control/Panel/month_year").set_text(month_string + ": Year # " + str(year_number))
##		yield()
##
