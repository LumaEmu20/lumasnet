/// @description hats & reset choice
spr_idle = selarray[sel[0]][0];

locked = false;
if sel[0] == 6
	locked = !file_exists("mario_information");

selmin = 0;
selmax = array_length(selarray) - 1;

