//macros for the game

//SOME GAME MACROS

#macro PLAYER obj_player
#macro FRAME_RATE 60
#macro TILE_SIZE 32
#macro CARDINAL_DIR_8 round(direction/45) //this is for a 8 dir sprite
#macro CARDINAL_DIR_4 round(direction/90) //this is for a 4 dir sprite


#region Resolution and Zoom
//global vars
global.isZoom = false;
global.isPan = false;
global.zoomSpd = .025;

//macros
#macro RES_WIDTH 640
#macro RES_HEIGHT 360
#macro ZOOMED_IN global.isZoom
#macro ZOOMED_OUT global.isPan
#macro ZOOM_SPEED global.zoomSpd

#endregion


//check if there is a gamepad conected or not
global.hasGamepad = false;
#macro HAS_GAMEPAD global.hasGamepad

//check if the game is paused or not
global.gamePaused = false;
#macro IS_PAUSED global.gamePaused

//check if game is in menu
global.isMenu = false;
#macro IS_MENU global.isMenu

#region Inputs
//use variables for changing values, use macros for reading values

//variables
global.keyLeft = noone;
global.keyRight = noone;
global.keyUp = noone;
global.keyDown = noone;
global.keyAction = noone;
global.keyAtkFast = noone;
global.keyAtkHeavy = noone;
global.keyRoll = noone;
global.acceleration = noone;
global.uiUp = noone;
global.uiDown = noone;
global.uiLeft = noone;
global.uiRight = noone;
global.uiNext = noone;
global.uiPrev = noone;
global.keyPause = noone;
global.keyMenu = noone;
global.keySprint = noone;

//macros
#macro LEFT global.keyLeft
#macro RIGHT global.keyRight
#macro UP global.keyUp
#macro DOWN global.keyDown
#macro ACTION global.keyAction
#macro FAST_ATK global.keyAtkFast
#macro HEAVY_ATK global.keyAtkHeavy
#macro ROLL global.keyRoll
#macro ACCEL global.acceleration
#macro UI_UP global.uiUp
#macro UI_DOWN global.uiDown
#macro UI_LEFT global.uiLeft
#macro UI_RIGHT global.uiRight
#macro SPRINT global.keySprint

//for easing the readability of controllers
#macro A_OR_CROSS gp_face1
#macro B_OR_CIRCLE gp_face2
#macro X_OR_SQUARE gp_face3
#macro Y_OR_TRIANGLE gp_face4
#macro RB_OT_R1 gp_shoulderr
#macro RT_OT_R2 gp_shoulderrb
#macro LB_OT_L1 gp_shoulderl
#macro LT_OT_L2 gp_shoulderlb

#endregion

#region World
//global vars
global.isCity = false;
global.isArcadia = false;
global.moveFriction = .05;

//macros
#macro CITY global.isCity
#macro ARCADIA global.isArcadia

#endregion