event_inherited();
if global.gameplay == 0
{
	spr_intro = spr_toppintomato_intro;
	spr_idle = spr_toppintomato;
	spr_run = spr_toppintomato_run;
	spr_panic = spr_toppintomato_panic;
	spr_panicidle = spr_toppintomato_panicidle;
	
	spr_intro_strongcold = spr_xmastomatotoppin_intro;
	spr_idle_strongcold = spr_xmastomatotoppin_idle;
	spr_run_strongcold = spr_xmastomatotoppin_walk;
	spr_panic_strongcold = spr_xmastomatotoppin_panic;
	spr_panicidle_strongcold = spr_xmastomatotoppin_panicidle;
}
else
{
	spr_intro = spr_toppintomato_intro_NEW;
	spr_idle = spr_toppintomato_NEW;
	spr_run = spr_toppintomato_run_NEW;
	spr_panic = spr_toppintomato_run_NEW;
	spr_panicidle = spr_toppintomato_panic_NEW;
	
	spr_intro_strongcold = spr_xmastoppintomato_intro_NEW;
	spr_idle_strongcold = spr_xmastoppintomato_NEW;
	spr_run_strongcold = spr_xmastoppintomato_run_NEW;
	spr_panic_strongcold = spr_xmastoppintomato_run_NEW;
	spr_panicidle_strongcold = spr_xmastoppintomato_panic_NEW;
	
	yoffset = 0;
}
