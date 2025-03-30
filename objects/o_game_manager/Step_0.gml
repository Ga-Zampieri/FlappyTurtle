
function startGame() {
    instance_create_layer(_var_center_x_camera, _var_center_y_camera, "Instances", o_turtle);
    gameStarted = true;
    executar_periodicamente();
}

function instancePipes() {
    var _randint = random_range(80, 100);
    var _randIntSumOrMinus = round(random_range(1,2))
    
    if (_randIntSumOrMinus == 1) {
        instance_create_layer(_var_x_instance_pipes, (_var_y_instance_pipes - _randint), "Instances", o_green_down_pipe);
        instance_create_layer(_var_x_instance_pipes, (_var_y_instance_pipes), "Instances", o_green_upper_pipe);
    } else {
        instance_create_layer(_var_x_instance_pipes, (_var_y_instance_pipes), "Instances", o_green_down_pipe);
        instance_create_layer(_var_x_instance_pipes, (_var_y_instance_pipes + _randint), "Instances", o_green_upper_pipe);
    }
}

function executar_periodicamente() {
    if !gameFinished and !gamePaused {
        instancePipes();
        alarm[0] = 150;
    } else {
        alarm[0] = 150;   
    }
}

function finishGame() {
    instance_create_depth(_var_center_x_camera, _var_center_y_camera, -999, o_gameover)
    gameIsRunning = false;
    gameFinished = true;
}

function pauseGame() {
    instance_create_depth(_var_center_x_camera, _var_center_y_camera, -998, o_pause_game);
    gameIsRunning = false;
    gamePaused = true;
}

function incremetHighscore() {
    var nearest_pipe = instance_nearest(o_turtle.x, o_turtle.y, o_green_pipe);
    if (nearest_pipe != noone && nearest_pipe.x == o_turtle.x) {
        o_turtle._highscore++; 
    }
    if (instance_exists(o_number)) {
        instance_destroy(o_number);
    }
    return o_turtle._highscore;
}

function getStringHighscore() {
    var _highscore = o_turtle._highscore;
    return string(_highscore);
}

function displayHighscore() {
    var _array = [];
    var _highscore = getStringHighscore();
    for (var i = 1; i <= string_length(_highscore); i++) {
        var char = string_char_at(_highscore, i);
        switch (char) {
            case "0":
                array_push(_array, o_0);
                break;
            case "1":
                array_push(_array, o_1);
                break;
            case "2":
                array_push(_array, o_2);
                break;
            case "3":
                array_push(_array, o_3);
                break;
            case "4":
                array_push(_array, o_4);
                break;
            case "5":
                array_push(_array, o_5);
                break;
            case "6":
                array_push(_array, o_6);
                break;
            case "7":
                array_push(_array, o_7);
                break;
            case "8":
                array_push(_array, o_8);
                break;
            case "9":
                array_push(_array, o_9);
                break;
            default:
                break;
        }
    }
    
    var x_numeros = _var_center_x_camera;
    if array_length(_array) > 1 {
        x_numeros = _var_center_x_camera - 20
    }
    
    for (var i = 0; i < array_length(_array); i++) {
        instance_create_depth(x_numeros, 40, -998, _array[i])
        x_numeros+=20
    }
}
    
if (instance_exists(o_start_game) and keyboard_check(vk_space)) {
    instance_destroy(o_start_game);
    gameIsRunning = true;
    startGame();
}

if  gameStarted {
    if (!instance_exists(o_turtle)) {
        finishGame();
    }
}

if gameFinished {
    if (instance_exists(o_gameover) and keyboard_check_pressed(vk_space)) {
        room_restart();   
    }
}

if !gameFinished {
    if (keyboard_check_pressed(vk_escape)) {
        pauseGame();
    }
}

if gamePaused {
    if !instance_exists(o_turtle) {
        exit;
    }
    if instance_exists(o_green_pipe) {
        o_green_pipe.hspeed = 0;
    }
    
    o_turtle.gamePaused();
    o_green_pipe.gamePaused();
    if keyboard_check_pressed(vk_space) {
        gamePaused = false;
        gameIsRunning = true;
        instance_destroy(o_pause_game);
        o_turtle.gameUnpaused();
        o_green_pipe.hspeed = -1;
    }
}

if gameIsRunning {
    incremetHighscore();
    displayHighscore();
}