module main;

import util;
import dgs.all;

import Data: Data, CharaData;
import scene.Scene: Scene;
import scene.GameScene: GameScene;

void main()
{
    initDgs("dgs/lib", 1280, 960, true);
    scope(exit) destroyDgs();
    setWindowTitle("YoMoYu");

    Scene scene = GameScene();

    openWindow();

    while(true)
    {
        processEvents();
        clearWindow();

        scene.update(scene);
        
        updateWindow();
    }
}

