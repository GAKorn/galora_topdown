/// @description

#region Zoom
	//deffine
	if ZOOMED_IN target_zoom = 2;
	else if ZOOMED_OUT target_zoom = .5;
	else target_zoom = 1
	
	//apply
	zoom = approach(zoom, target_zoom, ZOOM_SPEED);	
#endregion

if keyboard_check_pressed(ord("1")){
	ZOOMED_IN = true;
	ZOOMED_OUT = false;
}

if keyboard_check_pressed(ord("2")){
	ZOOMED_IN = false;
	ZOOMED_OUT = false;
}

if keyboard_check_pressed(ord("3")){
	ZOOMED_IN = false;
	ZOOMED_OUT = true;
}


//following player
camera_basic_behavior();