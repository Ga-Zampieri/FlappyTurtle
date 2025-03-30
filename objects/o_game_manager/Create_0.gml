window_set_fullscreen(true);
gameStarted = false;
gameIsRunning = false;
gamePaused = false;
gameFinished = false;
_var_center_x_camera = camera_get_view_width(view_get_camera(0))/2;
_var_center_y_camera = camera_get_view_height(view_get_camera(0))/2;
_var_x_instance_pipes = camera_get_view_width(view_get_camera(0)) + 20;
_var_y_instance_pipes = (camera_get_view_height(view_get_camera(0))/2)
instance_create_layer(_var_center_x_camera, _var_center_y_camera, "Instances", o_start_game);
_speed_befre_pause = 0;
_units_highscre = [];