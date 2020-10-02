/// @description ???

#region Control Mapping
function get_input() {
	if HAS_GAMEPAD {
		//directions
		global.keyLeft = gamepad_axis_value(pad, gp_axislh) < -deadzone;
		global.keyRight = gamepad_axis_value(pad, gp_axislh) > deadzone;
		global.keyUp = gamepad_axis_value(pad, gp_axislv) < -deadzone;
		global.keyDown = gamepad_axis_value(pad, gp_axislv) > deadzone;

		//ui directions - to be used in GUI stuff
		global.uiUp = gamepad_axis_value(pad, gp_axislv) <= -1;
		global.uiDown = gamepad_axis_value(pad, gp_axislv) >= 1;
		global.uiLeft = gamepad_axis_value(pad, gp_axislh) <= -1;
		global.uiRight = gamepad_axis_value(pad, gp_axislh) >= 1;
		global.uiNext = gamepad_button_check_pressed(pad, gp_shoulderr);
		global.uiPrev = gamepad_button_check_pressed(pad, gp_shoulderl);

		//buttons
		global.keyAction = gamepad_button_check_pressed(pad, A_OR_CROSS);			
		global.keyAtkFast = gamepad_button_check_pressed(pad, X_OR_SQUARE);		
		global.keyAtkHeavy = gamepad_button_check_pressed(pad, Y_OR_TRIANGLE);		
		global.keyRoll = gamepad_button_check_pressed(pad, B_OR_CIRCLE);			
		global.keySprint = gamepad_button_check(pad, RT_OT_R2)		

		//otherbuttons
		global.keyPause = gamepad_button_check_pressed(pad, gp_start);									
		global.keyMenu = gamepad_button_check_pressed(pad, gp_select);

		//acceleration
		global.acceleration = max(abs(gamepad_axis_value(pad, gp_axislh)), abs(gamepad_axis_value(pad, gp_axislv)));
	
	} else {
		//directions
		global.keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
		global.keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
		global.keyUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
		global.keyDown = keyboard_check(vk_down) or keyboard_check(ord("S"));

		//ui directions - to be used in GUI stuff
		global.uiUp = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
		global.uiDown = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
		global.uiLeft = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
		global.uiRight = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
		global.uiNext = keyboard_check_pressed(ord("E"));
		global.uiPrev = keyboard_check_pressed(ord("Q"));

		//buttons
		global.keyAction = keyboard_check_pressed(ord("E"));
		global.keyAtkFast = keyboard_check_pressed(ord("Q")) or mouse_check_button_pressed(mb_left); 
		global.keyAtkHeavy = keyboard_check_pressed(ord("R")) or mouse_check_button_pressed(mb_right);
		global.keyRoll = keyboard_check_pressed(vk_space);
		global.keySprint = keyboard_check(vk_lshift);

		//otherbuttons
		global.keyPause = keyboard_check_pressed(vk_escape);
		global.keyMenu = keyboard_check_pressed(vk_tab);

		//acceleration
		global.acceleration = 1;	
	
	}
}
#endregion

#region GameState
	//controlls the state of the game - free, paused, menu
	gameState = new StateMachine("free",

		"free", {
			enter: function() {
			
			},
			step: function() {
				//state change
				if IS_PAUSED		state_switch("paused");
				if IS_MENU			state_switch("menu");
			
			}
		},
	
		"paused", {
			enter: function() {
				instance_deactivate_all(true);
			
			},
			step: function() {
				
				//state change
				if global.keyPause	state_switch("free");
			
			},
			leave: function() {
				instance_activate_all();
			}
		},
	
		"menu", {
			enter: function() {
				instance_deactivate_all(true);			
			},
			step: function() {

			},
			leave: function() {
				instance_activate_all();
			}
		},		
	);

#endregion

instance_create_layer(x,y, "Controllers", oCamera);