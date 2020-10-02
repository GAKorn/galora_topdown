/// @description ???
/*-------- OBJECT DEFINITION

This object controls game resolution and camera behaviors.

---------*/
//Setting the base camera
cam = view_camera[0];
main_surface = application_surface;
follow = PLAYER;

//zoom variables
zoom = 2;
target_zoom = zoom;

//setting the size of the game window
//viewW = RES_WIDTH*2;
//viewH = RES_HEIGHT*2;
window_set_size(RES_WIDTH, RES_HEIGHT);

//resizing surfaces
surface_resize(main_surface, RES_WIDTH, RES_HEIGHT);
display_set_gui_size(RES_WIDTH, RES_HEIGHT);
window_center();



#region CAMERA FUNCTIONS

///@func	camera_basic_behavior()
///@return	N/A
function camera_basic_behavior(){
	/*------
	This function apply the follow player and zoom reescale situation.
	------*/
	if instance_exists(follow) {
		//base logic inside variables to ease implementation
		var //defining the camera size
			_camW = RES_WIDTH/zoom,
			_camH = RES_HEIGHT/zoom,
			
			//finding the player center position
			_playerX = follow.x,
			_playerY = follow.y - ((sprite_height/2)+50),
		
			//defining camera target position
			_x = clamp(_playerX - _camW/2, 0, room_width - _camW),
			_y = clamp(_playerY - _camH/2, 0, room_height - _camH),
		
			//getting the current position of the camera
			_curX = camera_get_view_x(cam),
			_curY = camera_get_view_y(cam),
		
			//defining the speed to follow
			_spd = .075;
		
			//calculating smooth movement
			_finalX = lerp(_curX, _x, _spd);
			_finalY = lerp(_curY, _y, _spd);
	
		//applying screenshack - TODO
	
		//applying movement and size
		camera_set_view_pos(cam, _finalX, _finalY);		
		camera_set_view_size(cam, _camW, _camH);	
	}
	
}


#endregion