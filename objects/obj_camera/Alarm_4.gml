if global.combo > 0 or global.gameplay == 0
	exit;

with obj_comboend
{
    for (var i = 0; i < comboscore; i += comboscore)
        create_collect(obj_player.x + irandom_range(-60, 60), obj_player.y - 100 + irandom_range(-60, 60), scr_collectsprite())
    comboscore = 0
    instance_destroy()
}
with instance_create(x, y, obj_comboend)
{
    combo = global.savedcombo
    comboscore = global.comboscore
    combominus = round(comboscore / 50)
}
global.comboscore = 0
global.savedcombo = 0
