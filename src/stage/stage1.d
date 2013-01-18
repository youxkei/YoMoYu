module stage.stage1;

import Data: Data;
import scene.GameScene: EnemiesRange;

bool stage1(Data data, size_t frameCount, EnemiesRange range)
{
    if(frameCount == 0)
    {
        auto enemy = range.front;
        range.popFront();

        enemy.image = data.enemyDataList[0].image;
        enemy.x = 400;
        enemy.y = 50;
        enemy.center.x = 16;
        enemy.center.y = 16;
        enemy.visible = true;
    }

    return false;
}
