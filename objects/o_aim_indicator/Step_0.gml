
if(instance_exists(O_player))
{
	direction = point_direction(O_player.x, O_player.y, mouse_x, mouse_y);
	x = O_player.x + lengthdir_x(radius, direction);
	y = O_player.y + lengthdir_y(radius, direction);
}