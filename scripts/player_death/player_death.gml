function player_death(_target_object)
{
	if (place_meeting(x, y, _target_object))
		room_restart();
}