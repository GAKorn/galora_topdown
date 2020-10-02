/// @description ???

//Game Paused State
if IS_PAUSED {
	#region PAUSED STATE
		var rec_x = display_get_gui_width(), rec_y = display_get_gui_height();
		draw_set_color(c_black);
		draw_set_alpha(0.65);
		draw_rectangle(0,0,rec_x,rec_y,false);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text((rec_x/2)-35, rec_y/2, "Game Paused");
	#endregion
}

//inGame Menu State - Inventory, Quests, etc...
if IS_MENU {
	#region IN GAME MENU STATE
		
	
	

	#endregion
}