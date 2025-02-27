switch (state)
{
	case states.idle: scr_enemy_idle (); break;
	case states.charge: scr_enemy_charge (); break;
	case states.turn: scr_enemy_turn (); break;
	case states.walk: scr_enemy_walk (); break;
	case states.land: scr_enemy_land (); break;
	case states.hit: scr_enemy_hit (); break;
	case states.stun: scr_enemy_stun (); break;
	case states.pizzagoblinthrow: scr_pizzagoblin_throw (); break;
	// grabbed state here
}


if  state = states.stun && stunned > 40 && birdcreated = false
{
birdcreated = true
with instance_create(x,y, obj_enemybird)
ID = other.id
}

if state != states.stun
birdcreated = false
//Sprites

idlespr = spr_kentukykenny_idle
stunfallspr = spr_kentukykenny_stun
walkspr =spr_kentukykenny_walk
stunspr = spr_kentukykenny_stun
grabbedspr = spr_kentukykenny_stun


//Flash
if (flash == true && alarm[2] <= 0) {
   alarm[2] = 0.15 * room_speed; // Flashes for 0.8 seconds before turning back to normal
}


if state != states.grabbed
depth = 0


if state != states.stun
thrown= false


if bombreset > 0
	bombreset = max(bombreset - 1, 0);

scr_scareenemy();

//Identify the player
var targetplayer = instance_nearest(x,y ,obj_player)


//Throw Bomb at
if x != targetplayer.x && state != states.pizzagoblinthrow && bombreset = 0  && grounded
{
	if ((targetplayer.x > x - 400) && (targetplayer.x < x + 400)) && (y <= targetplayer.y+20 && y >= targetplayer.y- 20)
	{
		if (state == states.walk or state == states.idle) 
		{
			sprite_index = spr_kentukykenny_throw
			image_index = 0
			image_xscale = -sign(x - targetplayer.x)
			state = states.pizzagoblinthrow
		}
	}
}

if !boundbox
{
	with instance_create(x,y,obj_baddiecollisionbox)
	{
		sprite_index = other.sprite_index
		mask_index = sprite_index
		baddieID = other.id
		other.boundbox = true
	}
}