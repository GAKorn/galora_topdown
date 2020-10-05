/// @description Initializing Player object
spriteDirection = 3;
inputDirection = undefined;	//Assembling Vector
inputMagnitude = undefined;
//oldSprite = undefined;
oldDir = undefined;
facingDir = undefined;
stateName = "";

spdWalk = 2;
spdJog = 4;
spdRun = 6;
spdRoll = 7;
spdDash = 10;

canDash = true;

#region		----------	STATE MACHINE	----------
/*----------
The  State Machine for the player.
We define everything as parameters for the constructor (class?) of the state machine.
----------*/

state = new StateMachine("idle",
	
	"idle", {
		enter: function(){
			#region Making the transition animation as smooth as possible
				//updating sprite direction
				if (oldDir != undefined){
					var _spr = player_get_sprite(facingDir);
					sprite_index = _spr;
				} else {
					var _spr = player_get_sprite();
					sprite_index = _spr;
				}
			#endregion
			//other stuff goes here
			
			
		},
		step: function(){
			//this is the STEP EVENT
			#region Movement and Direction Logic
				
				//Here we apply all the logic for the player movement, so we can always check every direction of the player.				
				/*inputDirection = point_direction(0, 0 , RIGHT - LEFT, DOWN - UP);	//Assembling Vector
				inputMagnitude = ((RIGHT - LEFT) != 0) or ((DOWN - UP) != 0);		//Normalizing Vector and generating a value of 1
				direction = inputDirection;											//Passing Vector to built in Direction
				spriteDirection = CARDINAL_DIR_4;									//Rounding direction for sprite
				*/
				player_assemble_base_direction();
				stateName = "idle";
				
				
			#endregion
			
			#region Animation and SpriteChange
				//updating sprite direction
				if (oldDir != undefined){
					var _spr = player_get_sprite(facingDir);
					sprite_index = _spr;
				} else {
					var _spr = player_get_sprite();
					sprite_index = _spr;
				}
			#endregion
			
			#region Change State
				if (ROLL) {
					state_switch("roll");
				}
				else if (inputMagnitude != 0) state_switch("move");
			
			#endregion
			
			
		},
	},
	"move", {
		enter: function(){
			
			
			
		},
		step: function() {  //this is the STEP EVENT
			
			#region Movement Logic
				
				player_assemble_base_direction();
				
				//limiting speed
				//vars
				var _maxSpeed = 0, hSpd = 0, vSpd = 0, _speed = 0, _friction = 0;
				
				//speed with acceleration
				_maxSpeed = set_player_max_speed(spdWalk, spdJog, spdRun);
				_speed = inputMagnitude * lerp(0, _maxSpeed, ACCEL);
				
				//apply friction
				_friction = get_friction();
				_speed = lerp(_speed, 0, _friction);
				
				//store previous direction
				if (abs(_speed) > .75) {
					facingDir = spriteDirection;
					oldDir = direction;
				}
				
				//stop
				if (_speed <= .4) _speed = 0;
				
				//applly movement
				hSpd = lengthdir_x(_speed, inputDirection);
				vSpd = lengthdir_y(_speed, inputDirection);
				
				move_and_collide(hSpd, vSpd);
				
			#endregion
			
			#region Micro State
				//change micro state
				//this is the RUN micro state
				if (_speed > spdJog)				stateName = "run";
				//this is the WALK microstate	
				else if (_speed < (spdWalk + .2))	stateName = "walk";					
				//this is the JOG microstate
				else								stateName = "jog";			
				
			#endregion
			
			#region Animation and SpriteChange				
				var _spr = player_get_sprite();
				sprite_index = _spr;
			#endregion
			
			#region Change State
				if (ROLL) {
					state_switch("roll");
				}
				else if (_speed <= 0) state_switch("idle");
			#endregion
			
		},
	},
	"roll", {
		enter: function(){
			_prev = state.get_previous();
			dashFactor = 4
			dashDistance = TILE_SIZE*dashFactor;
			move_distance_remaining = dashDistance;
			
		},
		step: function(){
			//show_debug_message(thisDir)
			//init some vars
			var hSpd = 0, vSpd = 0, _spd;
			
			#region Setting the Micro State
				if (canDash) {
					stateName = "dash";
					_spd = spdDash;
				} else {
					stateName = "roll"
					_spd = spdRoll;
				}
			#endregion
			
			//set velocity
			hSpd = lengthdir_x(_spd, oldDir);
			vSpd = lengthdir_y(_spd, oldDir);
			
			//for how long we dash/roll
			move_distance_remaining = max(0, move_distance_remaining - _spd)
			var _collided = move_and_collide(hSpd, vSpd);
			
			#region Update Sprite
				var _spr = player_get_sprite();
				sprite_index = _spr;
			#endregion
			
			#region Change State
				if (_collided) {
					state_switch(_prev);
					//we will do more things in here
				}
				else if (move_distance_remaining <= 0) state_switch(_prev);			
			#endregion
			
		},
	},
	"quick_attack", {
		enter: function(){
			
			
		},
		step: function(){
			
		},
	},
	"heavy_attack", {
		enter: function(){
			
			
		},
		step: function(){
			
		},
	},
	"interact", {
		enter: function(){
			
			
		},
		step: function(){
			
		},
	}
);
#endregion

//other stuff