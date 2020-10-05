//TODO - MAKE CHANGES TO THIS SYSTEM TO BE BETTER!!!

///@desc move_and_collide
///@param _hSpd
///@param _vSpd
function move_and_collide(_hSpd, _vSpd){
	var _collided = false,
		//_hasCollision = false,
		//_tileCollided_h = false,
		//_tileCollided_v = false,
		_collision_map = layer_tilemap_get_id(layer_get_id("Collision")); //make sure this is the name in all rooms!!!
	
	/*
	//getting the bboxes and speed to count
	var _x1 = x - bbox_left,
		_y1 = y - bbox_top,
		_x2 = x + bbox_right,
		_y2 = y + bbox_bottom;
	
	//getting the correct collisions in variables
	var _leftColl = tilemap_get_at_pixel(_collision_map, bbox_left + _hSpd, y),
		_rightColl = tilemap_get_at_pixel(_collision_map, bbox_right + _hSpd, y),
		_topColl = tilemap_get_at_pixel(_collision_map, x, bbox_top + _vSpd),
		_botColl = tilemap_get_at_pixel(_collision_map, x, bbox_bottom + _vSpd);
	*/	
	
	//horizontal tiles
	if (tilemap_get_at_pixel(_collision_map, x + _hSpd, y)){
		x -= x mod TILE_SIZE;
		if (sign(_hSpd) == 1) x += TILE_SIZE - 1;
		_collided = true;
		_hSpd = 0
	}
	x += _hSpd
		
	//vertical tiles
	if (tilemap_get_at_pixel(_collision_map, x, y + _vSpd)) {
		y -= y mod TILE_SIZE;
		if (sign(_vSpd) == 1) y += TILE_SIZE -1;
		_collided = true;
		_vSpd = 0
	}
	y += _vSpd;
	/*
	//checks for obj collision
	if (!_collided){
		//horizontal
		if place_meeting(x + _hSpd, y, pCollider){
			repeat (abs(_hSpd)+1){
				if place_meeting(x + sign(_hSpd), y, pCollider){
					_collided = true;
					_hSpd = 0;
				}
			}
		}
		x += _hSpd;
		//vertical
		if place_meeting(x, y + _vSpd, pCollider){
			repeat (abs(_vSpd)+1){
				if place_meeting(x, y + sign(_vSpd), pCollider){
					_collided = true;
					_vSpd = 0;
				}
			}
		}
		y += _vSpd;		
	}*/
	
	//return
	
	return _collided;		
}
	
function move_and_collide_ext (_hSpd, _vSpd){
	var _collided = false;
	//horizontal
	if (place_meeting(x + _hSpd, y, pCollider)){
		repeat (abs(_hSpd)+1){
			if place_meeting(x + sign(_hSpd), y, pCollider){
				_hSpd = 0;
				_collided = true;
			}
		}
	}
				
	//vertical
	if (place_meeting(x, y + _vSpd, pCollider)){
		repeat (abs(_vSpd)+1){
			if place_meeting(x, y + sign(_vSpd), pCollider){
				_vSpd = 0;
				_collided = true;
			}
		}
	}
				
	_collided = move_and_collide(_hSpd, _vSpd);
	
	return _collided;
}