function player_death(_target_object)
{
	// CHECK FOR DEATH CONDITION (SE O PERSONAGEM ATINGIR O LIMITE INFERIOR)
    if (y >= room_height - sprite_height + 96) {
        room_restart();
	}
	
	if (place_meeting(x, y, Object16))
	{
		room_restart();
	}
}