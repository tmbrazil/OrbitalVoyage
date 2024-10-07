// Verifica se a tecla Espaço está pressionada
if keyboard_check(ord("V")) {
    // Cria o tiro na posição central do objeto space_game_invader
    var _tiro = instance_create_layer(x, y + sprite_height / 2, "Instances", _shot_1);
    
    // Define a direção e velocidade do tiro
    _tiro.direction = 270; //reção para cima
    _tiro.speed = 8; // Define a velocidade do tiro
    
    show_debug_message("Espaço foi pressionado!"); // Mostra a mensagem no terminal
}


