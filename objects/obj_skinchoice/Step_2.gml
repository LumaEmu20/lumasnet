if selected
{
	xoffset = lerp(xoffset, 0, 0.25);
	yoffset = lerp(yoffset, 0, 0.25);
	exit;
}
event_inherited();
if con == 1
	exit;

if sel[1] == "N" && key_taunt2
{
	scr_soundeffect(sfx_step);
	noisetype = !noisetype;
}

// change character
var lastchar = "SP";
if debug
	lastchar = "PUFFER";

if key_down2 && sel[1] != lastchar
{
	surface_free(palsurf);
	scr_soundeffect(sfx_step);
	
	yoffset = 100;
	switch sel[1]
	{
		case "P":
			sel[1] = "N";
			break;
		case "N":
			sel[1] = "V";
			break;
		case "V":
			sel[1] = "S";
			break;
		case "S":
			sel[1] = "PP"; // to pissino
			break;
		case "PP":
			sel[1] = "SP"; // to pizzelle
			break;
		case "SP":
			sel[1] = "SN"; // to pizzano
			break;
		case "SN":
			sel[1] = "CT"; // to cheemstoon
			break;
		case "CT":
			sel[1] = "PUFFER"; // to beloved
			break;
		
		/*
			sel[1] = "M";
			break;
		case "M":
			sel[1] = "SP";
			break;
		*/
	}
	event_user(0);
}
else if key_up2 && sel[1] != "P"
{
	surface_free(palsurf);
	scr_soundeffect(sfx_step);
	
	yoffset = -100;
	switch sel[1]
	{
		case "N":
			sel[1] = "P";
			break;
		case "V":
			sel[1] = "N";
			break;
		case "S":
			sel[1] = "V";
			break;
		case "PP":
			sel[1] = "S";
			break;
		case "SP":
			sel[1] = "PP";
			break;
		case "SN": // from pizzano
			sel[1] = "SP"; // to pizzelle
			break;
		case "CT": // from cheemstoon
			sel[1] = "SN"; // to pizzano
			break;
		case "PUFFER": // from beloved
			sel[1] = "CT"; // to cheemstoon
			break;
	}
	event_user(0);
}