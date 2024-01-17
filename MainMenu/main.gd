extends Node2D




#a function to change world scene when press the play button
func _on_play_btn_pressed():
	get_tree().change_scene_to_file("res://Game Levels/world.tscn")

#a fucntion  to quit the game when quitBtn is pressed
func _on_exit_btn_pressed():
	get_tree().quit()
