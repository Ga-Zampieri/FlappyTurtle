if (!instance_exists(o_turtle)) {
    hspeed = 0;
}

function gamePaused() {
    hspeed = 0;
}

if (x <= -1) {
    instance_destroy();
}    