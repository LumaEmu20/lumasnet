if !place_meeting(x, y, obj_parryhitbox)
{
	with other
	{
		if character == "V"
			scr_hurtplayer(object_index)
		else if scr_transformationcheck()
		{
			if state != states.knightpep && state != states.knightpepslopes && state != states.knightpepattack
			&& !hurted && state != states.parry && state != states.hitlag
			{
				//scr_soundeffect(sfx_oh, sfx_ohman,sfx_hurt1,sfx_hurt2,sfx_hurt3, sfx_mammamia)
				scr_soundeffect(sfx_becomeknight)
				hsp = 0
				movespeed = 0
				state = states.knightpep
				image_index = 0
				sprite_index = spr_knightpepthunder
			
				instance_destroy(other)
			}
		}
	}
}

