// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function transition(_target_object, _new_room)
{
	if (place_meeting(x, y, _target_object))
	{
		room_goto(_new_room);
	}
}