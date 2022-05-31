extends Control
const months = ["January",
"Febuary","March","April",
"May","June","July","Aguest",
"September","October","November",
"December"]
#resource variables

var month_count: int = 0
var is_january: bool = true
var month_string: String = "January"
var year_number: int = 0
var prod_toggle = true

#construction cap
var cap = {
	"seeds": 0,
	"sugar": 0,
	"caff": 0,
	"branches": 0,
	"leaves": 0
}

var made_this_month = {
	"seeds": 0,
	"sugar": 0,
	"caff": 0,
	"branches": 0,
	"leaves": 0,
}

#player's current resource count
var play_in = {
	"water": 0,
	"minerals": 0,
	"sugar": 200,
	"seeds": 0,
	"caff": 0,
	"trunk": 0,
	"branches": 0,
	"roots": 0,
	"leaves": 0,
	"lives": 4
}
# modifiers
var mod = {
	"water": 1.0,
	"minerals": 1.0,
	"sugar": 1.0,
	"seeds": 1.0,
	"caff": 1.0,
	"trunk": 1.0,
	"branches": 1.0,
	"roots": 1.0,
	"leaves": 1.0
}

#structure variables
func _ready():
	update()
	

func _on_end_turn_pressed():
	month_count += 1
	next_month()
	january_checker()
	generate_resources()
	update()


func next_month():
	if month_count > 11:
		month_count = 0
		year_number += 1
	month_string = months[month_count]
	prod_toggle = true


func january_checker():
	if month_count == 0:
		is_january = true
	else:
		is_january = false

func generate_resources():
	play_in["minerals"] += floor(5 * play_in["roots"] * mod["minerals"])
	play_in["water"] += floor(5 * play_in["roots"] * mod["water"])
	

##updates all variables to screen to reflect transactions/changes
func update():
	
	cap["branches"] = play_in["trunk"] * 4
	cap["leaves"] = play_in["branches"] * 4
	cap["seeds"] = play_in["leaves"]
	cap["sugar"] = play_in["leaves"] * 2.5
	
	get_node("Control/Panel/month_year").set_text(month_string + ": Year # " + str(year_number))
	get_node("Stock_Pile/Stock_Panel/resources/Water").set_text("Water: " + str(play_in["water"]))
	get_node("Stock_Pile/Stock_Panel/resources/Sugar").set_text("Sugar: " + str(play_in["sugar"]) + "/" + str(cap["sugar"]))
	get_node("Stock_Pile/Stock_Panel/resources/Trunk").set_text("Trunk: " + str(play_in["trunk"]))
	get_node("Stock_Pile/Stock_Panel/resources/Roots").set_text("Roots: " + str(play_in["roots"]))
	get_node("Stock_Pile/Stock_Panel/resources/Seeds").set_text("Seeds: " + str(play_in["seeds"]) + "/" + str(cap["seeds"]))
	get_node("Stock_Pile/Stock_Panel/resources/Minerals").set_text("Minerals: " + str(play_in["minerals"]))
	get_node("Stock_Pile/Stock_Panel/resources/Branches").set_text("Branches: " + str(play_in["branches"])+ "/" + str(cap["branches"]))
	get_node("Stock_Pile/Stock_Panel/resources/Leaves").set_text("Leaves: " + str(play_in["leaves"])+ "/" + str(cap["leaves"]))
	get_node("Stock_Pile/Stock_Panel/resources/Caffine").set_text("Caffine: " + str(play_in["caff"]))
	get_node("Lives/lives_text").set_text("Lives: " + str(play_in["lives"]))
	

func con_log(arg_in : String):
	get_node("console/console_log").add_text("\n \t" + arg_in)
	


func prod_toggle_checker():
	#checks if you built something when its not january 
	if prod_toggle == false:
		con_log("It's not January, only one tree part per month")
		return false
	# after building one thing outside of january 
	# this toggles prod_toggle to trigger the if statement 
	# above when you try to build a second tree part
	else:
		if !is_january:
			prod_toggle = false
	return true
	
	
func _on_Roots_pressed():
	if prod_toggle_checker() == true: 
		if play_in["sugar"] < 5:
			con_log("not enough sugar to make roots")
		else:
			play_in["sugar"] -= 5
			play_in["roots"] += 1
			update()
			


func _on_Trunk_pressed():
	if prod_toggle_checker() == true:
		if play_in["sugar"] < 50:
			con_log("not enough sugar to make Trunk")
		else:
			play_in["sugar"] -= 50
			play_in["trunk"] += 1
			update()
			


func _on_Branch_pressed():
	if prod_toggle_checker() == true && cap["branches"] > made_this_month["branches"]:
		if play_in["sugar"] < 25:
			con_log("not enough sugar to make branches")
		else:
			play_in["sugar"] -= 25
			play_in["branches"] += 1
			update()


func _on_Leaf_pressed():
	if prod_toggle_checker() == true:  
		if cap["leaves"] == made_this_month["leaves"]:
			con_log("leaf cap reached. build more branches")
		elif play_in["sugar"] < 10:
			con_log("not enough sugar to make branches")
		else: 
			play_in["sugar"] -= 10
			play_in["leaves"] += 1
			update()
			


func _on_Buds_pressed():
	if prod_toggle_checker() == true:
		if cap["seeds"] == made_this_month["seeds"]:
			con_log("seed cap reached. build more leaves")
		elif play_in["sugar"] < 15:
			con_log("not enough sugar to make seeds")
		else:
			play_in["sugar"] -= 15
			play_in["seeds"] += 1
			update()



func _on_Caffine_pressed():
	if prod_toggle_checker() == true:
		if play_in["sugar"] < 1 || play_in["minerals"] < 1 :
			con_log("not enough resources to make Caffine")
		else:
			play_in["sugar"] -= 1
			play_in["minerals"] -= 1
			play_in["caff"] += 1
			update()


func _on_Sugar_pressed():
	if prod_toggle_checker() == true:
		if cap["leaves"] == made_this_month["leaves"]:
			con_log("sugar cap reached. build more leaves")
		if month_count <= 8:
			con_log("It is winter, there is not enough sun")
		elif play_in["water"] < 1 || play_in["minerals"] < 1 :
			con_log("not enough resources to make sugar")
		else:
			play_in["water"] -= 1
			play_in["minerals"] -= 1
			play_in["sugar"] += 1
			update()



