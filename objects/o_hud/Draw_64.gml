var HP_bar_width = sprite_get_width(healthbar);   //Width of the HP Bar
var HP_bar_height = sprite_get_height(healthbar);  //Height of the HP Bar
var health_percent =O_player.Hp/O_player.Hp;

if(instance_exists(O_player))
{
	draw_sprite_stretched(healthbar, 1, Bar_x, Bar_y, HP_bar_width *(O_player.Hp/O_player.MaxHp), HP_bar_height);
	draw_sprite(xpbar, 1, 1070, 770);
	draw_sprite_ext(ultimate_skill, 1, 813, 800, 1, 1, 0, -1, 1);
	draw_sprite_ext(dash_skill, 1, 625, 800, 1, 1, 0, -1, 1);
	draw_sprite_ext(attack_buff_skill, 1, 1000, 800, 1, 1, 0, -1, 1);
}