/// @description ???
get_input();

if (global.keyPause)	IS_PAUSED = !IS_PAUSED;
if (global.keyMenu)		IS_MENU = !IS_MENU;

gameState.step();