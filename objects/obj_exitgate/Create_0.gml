if global.snickchallenge && room != snick_challengeend
{
	instance_destroy();
	exit;
}

image_speed = 0
hurtpoints = false
timepoints = false
treasurepoints = false
lastbesttimeminutes = 99
lastbesthurt = 99
lastbesttimeseconds = 99
image_index = 1

depth = 50
endgate = false

roomname = room_get_name(room)
global.progress = string_letters(roomname)

if ds_list_find_index(global.saveroom, id) != -1 && !global.panic
	image_index = 0

if global.gameplay != 0
	sprite_index = spr_exitgate_NEW;
if check_sugary()
	sprite_index = spr_exitgate_ss;

