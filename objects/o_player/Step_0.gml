
// Controls	

Key_right = keyboard_check(ord("D"));
Key_up = keyboard_check(ord("S"));
Key_down = keyboard_check(ord("W"));
Key_left = keyboard_check(ord("A"));
Key_shoot = mouse_check_button_pressed(mb_left);
Key_dash = mouse_check_button_pressed(mb_right);
Key_testkey1 = keyboard_check_pressed(vk_numpad1);
Key_testkey2 = keyboard_check_pressed(vk_numpad2);

// Dashing

if (Key_dash = true and dashCooldown == 0)
{
	dashCooldown = 3 * 60;
	dash_skill_ability();
}

if(dashCooldown != 0)
{
	dashCooldown--;	
}

if (dashskill) {
    // dashing state behavior goes here
	
    HorizontalSpeed = lengthdir_x(dashSpeed, facingDirection);
    VerticalSpeed = lengthdir_y(dashSpeed, facingDirection);
    dashtime--;
    if (dashtime <= 0)
	{
        dashskill = false;
	}
}
else {
    // Interpret input
	
    var rightleft = Key_right - Key_left;
    var updown = Key_up - Key_down;
    inputDirection = point_direction(0, 0, rightleft, updown);
    inputMagintude = point_distance(0, 0, rightleft, updown);

    // Face direction of travel
	
    if (inputMagintude > 0)
    {
        facingDirection = inputDirection;
        image_angle = facingDirection;
    }

    // Decide intended movement
	
    HorizontalSpeed = lengthdir_x(inputMagintude * WalkSpeed, inputDirection);
    VerticalSpeed = lengthdir_y(inputMagintude * WalkSpeed, inputDirection);
}

// Horizontal movement

if (place_meeting(x + HorizontalSpeed, y, O_wall))
{
    while (!place_meeting(x + sign(HorizontalSpeed), y, O_wall))
    {
        x = x + sign(HorizontalSpeed);
    }
    HorizontalSpeed = 0;
}
x = x + HorizontalSpeed;

// Vertical movement

if (place_meeting(x, y + VerticalSpeed, O_wall))
{
    while (!place_meeting(x, y + sign(VerticalSpeed), O_wall))
    {
        y = y + sign(VerticalSpeed);
    }
    VerticalSpeed = 0;
}
y = y + VerticalSpeed;

//Shooting

if(Key_shoot)
{
	instance_create_layer(O_aim_indicator.x, O_aim_indicator.y, O_player.layer, O_playerbullet,
	{
		bullet_direction: O_aim_indicator.direction,
	});

}

//invincibility
if (alarm[0] > 0) {invincible = true;} else {invincible = false;}
if !(alarm[0] = -1)  //If the player is invincible 
and (alarm[1] = -1)  //And, the flicker alarm isn't counting down
{
    alarm[1] = flicker_frequency; //Set the flicker alarm to count down
}
else if (alarm[0] = -1) //Otherwise, the player isn't invincible
{ 
    visible = true; //Make the player visible
	invincible=false
	alarm[0] = 0;
}

//HP Management

if(Hp > MaxHp)
{
	Hp = MaxHp;	
}

if(Hp == 0 and LifeCount !=0)
{
	LifeCount -= 1;
	Hp = MaxHp;
}

if(Hp == 0 and LifeCount == 0)
{
	instance_destroy(id);	
}

if(Key_testkey1)
{
	Hp -= 10;
}

if(Key_testkey2)
{
	Hp += 10;
}