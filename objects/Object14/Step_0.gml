if (mouse_check_button_pressed(mb_left)) {  // Corrigido para usar mouse_check_button_pressed
    if (position_meeting(mouse_x, mouse_y, Object14)) {
        room_goto(R_Menu);  // Muda para a sala R_Menu
    }
}
