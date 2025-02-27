if instance_exists(obj_pausefadeout)
	instance_destroy(obj_pausefadeout)

if fadealpha > 1
{
	fadein = true
	if instance_exists(obj_player1)
	{
		if !custom_level
		{
			with obj_player1
			{
				if place_meeting(x, y, obj_goldendoor)
				{
					gms_logout();
					game_restart()
				}
				if baddiegrabbedID != 0 && baddiegrabbedID != obj_null && instance_exists(baddiegrabbedID)
				&& baddiegrabbedID.object_index != obj_pizzaballOLD
				&& baddiegrabbedID.object_index != obj_otherplayer
				{
					with baddiegrabbedID
						persistent = true;
					with obj_baddiecollisionbox
						if baddieID == other.baddiegrabbedID
							persistent = true;
				}
			}
			
			if room != obj_player1.targetRoom
				room_goto_new(obj_player1.targetRoom)
			else
			{
				with obj_player1
					event_perform(ev_other, ev_room_start);
				with obj_door
					event_perform(ev_other, ev_room_start);
			}
			
			with obj_player1
				if state == states.ladder
					ladderbuffer = 3;
		}
		else
		{
			with obj_door_editor
			{
				if object_index == other._id.object_index
				&& id != other._id
				&& index == other.index
				{
					other.xx = x + 50;
					other.yy = y + 50;
					if object_index == obj_keydoor_editor
						alarm[0] = 1;
				}
			}
			
			with obj_boxofpizza_editor
			{
				if object_index == other._id.object_index
				&& id != other._id
				&& index == other.index
				{
					other.xx = x;
					
					if sign(image_yscale) == -1
						other.yy = y - (24 * image_yscale);
					else
						other.yy = y - (80 * image_yscale);
				}
				enter = false;
			}
			
			with obj_player1
			{
				x = other.xx
				y = other.yy
			}
		}
		if instance_exists(obj_player1) && obj_player1.state == states.grabbed
		{
			fadealpha = 1
			cont = false;
			alarm[0] = 5;
		}
	}
}

if !fadein
	fadealpha += 0.1
else if cont
	fadealpha -= 0.1

with obj_player
{
	if other.fadein && (state == states.door or state == states.victory)
	{
		if sprite_index == spr_downpizzabox or sprite_index == spr_uppizzabox
			state = states.crouchjump
		else
		{
			c = 0;
			state = states.comingoutdoor
			image_index = 0
		}
	}
}

if fadein && fadealpha <= 0
	instance_destroy()

