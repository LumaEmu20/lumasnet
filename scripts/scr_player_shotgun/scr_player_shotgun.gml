function scr_player_shotgun()
{
	if !shotgunAnim
		state = states.normal;

	//Turn
	if dir != xscale
	{
		dir = xscale
		movespeed = 2 
		facehurt = false

	}
	move = key_left + key_right;
	
	var railh = 0, railmeet = instance_place(x, y + 1, obj_railparent);
	if railmeet then railh = railmeet.spdh;
	hsp = move * movespeed + railh;
	
	//Movespeed
	if move != 0 
	{
		if movespeed < 6
			movespeed += 0.5
		else if floor(movespeed) == 6
			movespeed = 6
	}
	else
		movespeed = 0

	if movespeed > 6
		movespeed -= 0.1
	
	if sprite_index == spr_shotgunpullout
		movespeed = 0

	if scr_solid(x + sign(hsp), y) && xscale == move && (!place_meeting(x + xscale, y, obj_slope) or scr_solid_slope(x + xscale, y))
		movespeed = 0
	
	landAnim = false
	momentum = true
	
	if character == "N"
	{
		var shooting = false

		if image_index + image_speed >= image_number
			shooting = true

		if shooting
		with instance_create(x + xscale * 60, y + 30, obj_shotgunbullet)
		{
			shotgun = true
			spdh = random_range(4,-1)
		}
	}


	if floor(image_index) >= image_number - 1 && character != "N"
	{
		if grounded
		{
			sprite_index = spr_shotgunidle
			state = states.normal
		}
		else
		{
			sprite_index = spr_shotgunfall
			state = states.jump
		}
	}
	
	if (!key_shoot && character = "N" && sprite_index != spr_shotgunpullout) or (sprite_index = spr_shotgunpullout && floor(image_index) = image_number -1)
	{
		if grounded
		{
			sprite_index = spr_shotgunidle
			state = states.normal
		}
		else
		{
			sprite_index = spr_shotgunfall
			state = states.jump
		}
	}
	
	image_speed = 0.4
	if !instance_exists(obj_slidecloud) && grounded && movespeed > 4
		instance_create(x, y, obj_slidecloud)
}

