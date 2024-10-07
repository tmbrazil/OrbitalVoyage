// Variáveis para controlar a movimentação
var _xd = 0;
var _yd = 0;
var _speed = 4;

// Movimento horizontal
if keyboard_check(vk_right) {
    _xd += _speed;
} 
if keyboard_check(vk_left) {
    _xd -= _speed;
}

// Movimento vertical
if keyboard_check(vk_up) {
    _yd -= _speed;
} 
if keyboard_check(vk_down) {
    _yd += _speed;
}

// Aplicando limites de movimento
if !place_meeting(x + _xd, y, inv_floor) {
    x += _xd;
}
if !place_meeting(x, y + _yd, inv_floor) {
    y += _yd;
}

// Verifica se a tecla Espaço está pressionada
if keyboard_check_pressed(vk_space) {
    // Cria o tiro na posição central do objeto space_game_invader
    var _tiro = instance_create_layer(x, y - sprite_height / 2, "Instances", _shot);
    
    // Define a direção e velocidade do tiro
    _tiro.direction = 90; // Direção para cima
    _tiro.speed = 10; // Define a velocidade do tiro
    
    show_debug_message("Espaço foi pressionado!"); // Mostra a mensagem no terminal
}
