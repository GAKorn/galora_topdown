//script containing auxiliars to the player

///@func		set_player_max_speed(_spdWalk, _spdJog, _spdRun)
///@param		{int} _spdWalk		The maximum walk speed for the player character | used in city, or not pushing the analog further
///@param		{int} _spdJog		The maximum jog speed | standart speed for the player character
///@param		{int} _spdRun		The maximum run speed | when the player is pressing the run button
///@return		{int} _maxSpd		Returns the maximum speed to be stored in a variable
function set_player_max_speed(_spdWalk, _spdJog, _spdRun) {
	var _maxSpd;
	
	if CITY _maxSpd = _spdWalk;
	else if SPRINT _maxSpd = _spdRun;
	else _maxSpd = _spdJog;
	
	return _maxSpd;	
}

///@func		player_get_sprite()
///@param		{string}   oldState 	the direction to keep
///@return		{resource} sprite		Returns the index sprite.
/*-------
MUST BE CALLED AFTER SETTING THE RIGHT DIRECTION
-------*/
function player_get_sprite(){
	var _dir = noone;
	if (argument_count > 0){
		var _d = argument[0]/45;
		_dir = get_8dir(_d);
	} else {
		_dir = get_8dir(CARDINAL_DIR_8);
	}
	var _sprName = "spr_player_"+stateName+"_"+_dir,
		_spr = asset_get_index(_sprName);
		
	return _spr;
	
}