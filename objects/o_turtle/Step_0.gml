function gamePaused() {
    image_index = 1;
    gravity = 0;
    o_game_manager._speed_before_pause = vspeed;
    vspeed = 0;
}

function gameUnpaused() {
    y += 30;
    gravity = 0.05;
    vspeed = o_game_manager._speed_before_pause;
}

if (keyboard_check_pressed(vk_space)) {
    vspeed = _verSpeed;
    y -= 30;
}

if (y >= 560 or y <= 0) {
    instance_destroy();
}