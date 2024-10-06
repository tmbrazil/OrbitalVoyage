function move_player()
{
    /* X MOVEMENT VARIABLES */
    var _xd = 0;
    var _speed = 4;
    var _friction = 0.15;

    // CHECKING INPUT
    if keyboard_check(vk_right)
        _xd += _speed;

    if keyboard_check(vk_left)
        _xd -= _speed;

    // APPLYING FRICTION
    _xd *= (1 - _friction);

    // HORIZONTAL COLLISION AND LIMIT CHECK
    var new_x = x + _xd; // Calcular nova posição X

    // Verifica se o player está nos limites da sala antes de mover
    if (new_x >= 0 && new_x <= room_width - sprite_width) {
        // Verifica colisão com o objeto
        if (!place_meeting(new_x, y, Object13)) {
            x = new_x; // Atualiza a posição se não houver colisão
        } else {
            // Ajusta o player se ele colidir com um objeto
            while (!place_meeting(x + sign(_xd), y, Object13)) {
                x += sign(_xd);
            }
        }
    }

    // DECLARING GRAVITY FORCE AND JUMP STRENGTH
    if !variable_instance_exists(self, "vy") {
        vy = 0;
    }
    var _gforce = 0.5;
    var _jump_strength = -10;

    // ADDING JUMP COUNT VARIABLE
    if !variable_instance_exists(self, "jump_count") {
        jump_count = 0;
    }

    // APPLYING GRAVITY
    if !place_meeting(x, y + 1, Object13) {
        vy += _gforce;
    } else {
        vy = 0;
        jump_count = 0; // Reseta o contador de pulos quando está no chão
    }

    // JUMPING
    if keyboard_check_pressed(vk_up) && (jump_count < 2) { // Permite até dois pulos
        vy = _jump_strength;
        jump_count += 1; // Aumenta o contador de pulos
    }

    // Y MOVEMENT (MOVIMENTO VERTICAL)
    if !place_meeting(x, y + vy, Object13) {
        y += vy;
    } else {
        // Ajusta o player se ele colidir com um objeto na vertical
        while (!place_meeting(x, y + sign(vy), Object13)) {
            y += sign(vy);
        }
        vy = 0;
    }

    // STICKING PLAYER (QUEDA SE ESTIVER ENCOSTANDO HORIZONTALMENTE E NÃO HÁ CHÃO)
    if (_xd != 0 && !place_meeting(x, y + 1, Object13)) {
        vy += _gforce;
    }

    // DRAWING VARIABLES (EXIBINDO VALORES NA TELA)
    show_debug_message("Velocidade horizontal (_xd): " + string(_xd));
    show_debug_message("Posição vertical (y): " + string(y));
	
}