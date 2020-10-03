/// @func		animation_end()
/// @returns	{bool}						Whether sprite_index has finished animating or not
/// @author		Minty Python
function animation_end() {
	return (image_index + image_speed*sprite_get_speed(sprite_index)/(sprite_get_speed_type(sprite_index)==
			spritespeed_framespergameframe? 1 : game_get_speed(gamespeed_fps)) >= image_number);	
}

/// @func		approach(val1, val2, amount)
/// @param		{real}	 val1				Initial value
/// @param		{real}	 val2				Target value
/// @param		{real}	 amount				Increment (or Decrement)
/// @returns	{real}						Changed value
/// @author		Meseta
function approach(_val1, _val2, _inc) {
	return (_val1 + clamp(_val2-_val1, -_inc, _inc));
}

//way to get the correct direction for naming the sprite
#region Direction  Getter

#region 8 direction - LEGACY
/*
///@func	get_8dir(direction)
///@param	{real} direction	The rounded direction, divided by 45 (8 dir)
///@return	_directionName		the direction name, in string format
function get_8dir(_dir){
	var _directionName;
	switch _dir {
		//facing right
		case 0:		_directionName = "right";		break;
	
		//facing up-right
		case 1:		_directionName = "up_right";		break;
	
		//facing up
		case 2:		_directionName = "up";			break;
	
		//facing up-left
		case 3:		_directionName = "up_left";		break;
	
		//facing left
		case 4:		_directionName = "left";			break;
	
		//facing down-left
		case 5:		_directionName = "down_left";	break;
	
		//facing down
		case 6:		_directionName = "down";			break;
	
		//facing down-right
		case 7:		_directionName = "down_right";	break;	
	}
	return _directionName;
	
}
*/
#endregion
	
///@func	get_4dir(direction)
///@param	{real} direction	The rounded direction, divided by 90 (4 dir)
///@return	_directionName		the direction name, in string format
function get_4dir(_dir){
	var _directionName = "";
	switch _dir {
		//facing right
		case 0:		_directionName = "right";	break;
	
		//facing up
		case 1:		_directionName = "up";		break;
	
		//facing left
		case 2:		_directionName = "left";	break;
	
		//facing down
		case 3:		_directionName = "down";	break;
		
		//facing right - to prevent bugs
		case 4:		_directionName = "right";	break;
	}
	return _directionName;
	
}
#endregion

//friction for the game - WE DO NOT CHANGE THE VALUE OTHER WAY THAN THROUGH THESE FUNCTIONS
#region Friction Getter and Setter

///@func	set_friction(_amount)
///@param	{real} friction		The amount of friction to set and apply to the player
///@return	N/A					xxx
function set_friction(_amount){
	global.moveFriction = _amount;	
}

///@func	get_friction(_amount)
///@param	N/A
///@return	friction			friction amount to be stored in a variable
function get_friction(){
	return global.moveFriction;
}

#endregion

//other stuff