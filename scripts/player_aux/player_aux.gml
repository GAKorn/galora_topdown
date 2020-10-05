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
	var _dir;
	if (argument_count > 0){
		//if (argument[0] != (0 or 1 or 2 or 3 or 4)) {
		//	var _d = round(argument[0]/90);
		//	_dir = get_4dir(_d);
		//} else {
			_dir = get_4dir(argument[0]);
		//}
	} else _dir = get_4dir(spriteDirection);
	
	var _sprName = "spr_player_"+stateName+"_"+_dir,
		_spr = asset_get_index(_sprName);
	show_debug_message(_sprName);
		
	return _spr;
	
}
	
///@func		player_assemble_base_direction()
///@desc		Code snipet that returns the direction and vector of the player movement and facing
//				wich we use for moving and everything else.
//				CAN ONLY BE USED BY THE PLAYER AND NEEDS PLAYER VARIABLES TO BE DECLARED FIRST!
function player_assemble_base_direction(){
	inputDirection = point_direction(0, 0 , RIGHT - LEFT, DOWN - UP);	//Assembling Vector
	inputMagnitude = ((RIGHT - LEFT) != 0) or ((DOWN - UP) != 0);		//Normalizing Vector and generating a value of 1
	direction = inputDirection;											//Passing Vector to built in Direction
	spriteDirection = CARDINAL_DIR_4;									//Divides direction by the number of directions we use in the game, so
																		//we can animate the sprites correctly.
}
/*	
///@func		player_move()
///@param		{string}   oldState 	the direction to keep
function player_move(){
	player_assemble_base_direction();
	//vars
	var _maxSpeed = 0, hSpd = 0, vSpd = 0, _speed = 0, _friction = 0;
				
	//speed with acceleration
	_maxSpeed = set_player_max_speed(spdWalk, spdJog, spdRun);
	_speed = inputMagnitude * lerp(0, _maxSpeed, ACCEL);
				
	//apply friction
	_friction = get_friction();
	_speed = lerp(_speed, 0, _friction);
				
	//store previous direction
	if (abs(_speed) > .75) oldDir = spriteDirection;
				
	//stop
	if (_speed <= .4) _speed = 0;
				
	//applly movement
	hSpd = lengthdir_x(_speed, inputDirection);
	vSpd = lengthdir_y(_speed, inputDirection);				
	move_and_collide(hSpd, vSpd);
	
	return _speed;
	
}*/