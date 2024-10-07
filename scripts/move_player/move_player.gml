function move_player(_type, _object)
{
    /* X MOVEMENT VARIABLES */
    var _xd = 0;
    var _speed;
    var _friction = 0.15;

    if (_type == 0)
    {
        _speed = 4;
    }

    if (_type == 1)
    {
        _speed = 1.5;
        var _yd = 0; // Variável para movimento vertical apenas para type 1
    }

    // CHECKING INPUT (HORIZONTAL)
    if keyboard_check(vk_right)
        _xd += _speed;

    if keyboard_check(vk_left)
        _xd -= _speed;

    // CHECKING INPUT (VERTICAL MOVEMENT - Apenas para _type == 1)
    if (_type == 1 && keyboard_check(vk_down))
    {
        _yd += _speed; // Movimenta para baixo no type 1
    }

    // APPLYING FRICTION
    _xd *= (1 - _friction);
    var new_x = x + _xd; // Calcular nova posição X

    if (_type == 1)
    {
        _yd *= (1 - _friction); // Aplica atrito também no eixo Y para type 1
        var new_y = y + _yd; // Calcular nova posição Y (para type 1)
    }

    // HORIZONTAL COLLISION AND LIMIT CHECK
    if (new_x >= 0 && new_x <= room_width - sprite_width)
    {
        // Verifica colisão com o objeto
        if (!place_meeting(new_x, y, _object))
        {
            x = new_x; // Atualiza a posição se não houver colisão
        }
        else
        {
            // Ajusta o player se ele colidir com um objeto
            while (!place_meeting(x + sign(_xd), y, _object))
            {
                x += sign(_xd);
            }
        }
    }

    // Para movimento vertical apenas em _type == 1
    if (_type == 1 && (new_y >= 0 && new_y <= room_height - sprite_height))
    {
        if (!place_meeting(x, new_y, _object))
        {
            y = new_y; // Atualiza a posição no eixo Y se não houver colisão
        }
        else
        {
            // Ajusta o player se ele colidir com um objeto no eixo Y
            while (!place_meeting(x, y + sign(_yd), _object))
            {
                y += sign(_yd);
            }
        }
    }

    // DECLARING GRAVITY FORCE AND JUMP STRENGTH
    if !variable_instance_exists(self, "vy") {
        vy = 0;
    }

    var _gforce, _jump_strength;

    if (_type == 0)
    {
        _gforce = 0.5;
        _jump_strength = -9.5;
    }

    if (_type == 1)
    {
        _gforce = 0.0002;
        _jump_strength = -2;
    }

    // ADDING JUMP COUNT VARIABLE
    if !variable_instance_exists(self, "jump_count") {
        jump_count = 0;
    }

    // APPLYING GRAVITY
    if !place_meeting(x, y + 1, _object) {
        vy += _gforce;
    } else {
        vy = 0;
        jump_count = 0; // Reseta o contador de pulos quando está no chão
    }

    // JUMPING (global para todos os tipos)
    if keyboard_check_pressed(vk_up) && (jump_count < 2) {
        vy = _jump_strength;
        jump_count += 1; // Aumenta o contador de pulos
    }

    // Y MOVEMENT (MOVIMENTO VERTICAL)
    if !place_meeting(x, y + vy, _object) {
        y += vy;
    } else {
        // Ajusta o player se ele colidir com um objeto na vertical
        while (!place_meeting(x, y + sign(vy), _object)) {
            y += sign(vy);
        }
        vy = 0;
    }

    // STICKING PLAYER (QUEDA SE ESTIVER ENCOSTANDO HORIZONTALMENTE E NÃO HÁ CHÃO)
    if (_xd != 0 && !place_meeting(x, y + 1, _object)) {
        vy += _gforce;
    }

    // DRAWING VARIABLES (EXIBINDO VALORES NA TELA)
    show_debug_message("Velocidade horizontal (_xd): " + string(_xd));
    show_debug_message("Posição vertical (y): " + string(y));
}
