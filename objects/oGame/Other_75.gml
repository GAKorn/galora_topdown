/// @description System Actions

//for now, we'll just load the gamepad

//debug messages to see what's happening
show_debug_message("Event = "+async_load[? "event_type"]);
show_debug_message("Pad = "+string(async_load[? "pad_index"]));

//the true event
switch (async_load[? "event_type"]) {						//parse the entire async load map to see the event triggered
	case "gamepad discovered":								//a gamepad has been discovered
		pad = async_load[? "pad_index"];					//get the pad index value
		deadzone = gamepad_set_axis_deadzone(pad, .35);		//set the gamepad deadzone
		treshold = gamepad_set_button_threshold(pad, .1);	//set treshhold for triggers
		global.hasGamepad = true;							//inform the whole game that there is a gamepad
	break;
	
	case "gamepad lost":									//Gamepad has been removed or otherwise disabled
		global.hasGamepad = false;							//informs the whole game that there is not a gamepad
	break;
}