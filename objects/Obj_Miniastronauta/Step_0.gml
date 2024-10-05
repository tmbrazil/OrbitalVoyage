/* HORIZONTAL */
var _xd = 0;

if keyboard_check(vk_right)
{
	_xd += 1;
}

if keyboard_check(vk_left)
{
	_xd -= 1;
}

if !place_meeting(x + sign(_xd), y, Object9)
{
	x += _xd;
}

else 
{
	while(!place_meeting(x + sign(_xd), y, Object9))
	{
		x += sign(_xd);
	}
}

/* GRAVITY APP */
var _vy = 0;
var _gforce = 2;

if !place_meeting(x, y + 1, Object9)
{
	_vy += _gforce;
} 

else 
{
	_vy = 0;
}

/* VERTICAL */
if !place_meeting(x, y + _vy, Object9)
{
	y += _vy;
}

else
{
	while(!place_meeting(x, sign(_vy), Object9))
	{
		y += sign(_vy);
	}
	_vy = 0;
}
		