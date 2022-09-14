if(!O_player.invincible) //if the player is not invincible while coliding with this enemy

{
	O_player.Hp-= damage; O_player.alarm[0]= 50 //do damage to the player and start the invincibility frames
	audio_play_sound(hit, 10, false);
}