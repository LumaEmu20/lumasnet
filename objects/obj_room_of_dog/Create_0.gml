if room != room_of_dog
{
	room_goto(room_of_dog);
	exit;
}

audio_stop_all();
with all
	if id != other.id instance_destroy(id, false);
scr_soundeffect(sfx_wawa);
surf = surface_create(100, 100);

