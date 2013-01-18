module scene.GameScene;

import std.range: Cycle, cycle;

import dgs.util: ctor, n;

import util: singleton;
import Chara: Chara;
import Enemy: Enemy;
import Data: Data, MAX_ENEMY;
import scene.Scene: Scene;
import stage.stage1: stage1;

alias Enemies = Enemy[MAX_ENEMY];
alias EnemiesRange = Cycle!Enemies;

final class GameScene: Scene
{
    public
    {
        mixin singleton;

        this()
        {
            data_ = Data();
            chara_ = new Chara
            (
                n!"data"(data_),
                n!"image"(data_.curChara.image),
                n!"x"(400),
                n!"y"(500),
                n!"center.x"(16),
                n!"center.y"(16),
            );
            foreach(ref enemy; enemies_)
            {
                enemy = new Enemy
                (
                    n!"data"(data_),
                    n!"visible"(false),
                );
            }
            enemiesRange_ = enemies_.cycle();
            stage_ = &stage1;
        }

        override
        void update(ref Scene next)
        {
            stage_(data_, frameCount_, enemiesRange_);
            move();
            draw();
            ++frameCount_;
        }
    }

    private
    {

        Data data_;
        size_t frameCount_;
        Chara chara_;
        Enemies enemies_;
        EnemiesRange enemiesRange_;
        bool function(Data, size_t, EnemiesRange) stage_;

        void move()
        {
            chara_.move();
        }

        void draw()
        {
            chara_.draw();
            foreach(enemy; enemies_)
            {
                enemy.draw();
            }
        }
    }
}
