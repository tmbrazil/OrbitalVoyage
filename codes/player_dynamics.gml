/* X MOVEMENT VARIABLES */
var _xd = 0;
var _speed = 2;
var _friction = 0.15;

// CHECKING INPUT
if keyboard_check(vk_right) {
    _xd += _speed;
}
if keyboard_check(vk_left) {
    _xd -= _speed;
}

// APPLYING FRICTION
_xd *= (1 - _friction);

// HORIZONTAL COLLISION
if !place_meeting(x + sign(_xd), y, Object9) {
    x += _xd;
} else {
    while(!place_meeting(x + sign(_xd), y, Object9)) {
        x += sign(_xd);
    }
    _xd = 0;
}

//DECLARING GRAVITY FORCE AND JUMP STRENGHT
if !variable_instance_exists(self, "vy") {
    vy = 0
}
var _gforce = 0.1;
var _jump_strength = -6;

// APPLYING GRAVITY
if !place_meeting(x, y + 1, Object9) {
    vy += _gforce;
} else {
    vy = 0;
}

// JUMPING
if keyboard_check_pressed(vk_up) && place_meeting(x, y + 1, Object9) {
    vy = _jump_strength;
}

// Y MOVEMENT
if !place_meeting(x, y + vy, Object9) {
    y += vy;
} else {
    while(!place_meeting(x, y + sign(vy), Object9)) {
        y += sign(vy);
    }
    vy = 0;
}