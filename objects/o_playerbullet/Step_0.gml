x += lengthdir_x(bullet_speed, bullet_direction);
y += lengthdir_y(bullet_speed, bullet_direction);
bullet_despawn_timer--;
if(bullet_despawn_timer == 0)
{
	instance_destroy(id);	
}