module Data;

import dgs.util:  ctor, n;
import dgs.Image: Image;
import dspecs;

import util: singleton;

enum MAX_ENEMY = 1 << 10;

final class CharaData
{
    Image image;

    mixin ctor;
}

final class EnemyData
{
    Image image;

    mixin ctor;
}

final class Data
{
    invariant()
    {
    }

    public
    {
        mixin singleton;

        CharaData[] charaDataList;
        size_t curCharaIndex;
        float charaSpeed, charaSkewSpeed;

        EnemyData[] enemyDataList;

        this()
        {
            charaDataList = 
            [
                new CharaData
                (
                    n!"image"(new Image("image/chara/yutopp.png")),
                ),
                new CharaData
                (
                    n!"image"(new Image("image/chara/mopp_jp.png")),
                )
            ];
            enemyDataList = 
            [
                new EnemyData
                (
                    n!"image"(new Image("image/enemy/mopp_jp.png")),
                ),
            ];
            curCharaIndex = 0;
            charaSpeed = 4.0;
            charaSkewSpeed = 4.0*0.707106781;
        }

        CharaData curChara() @property @safe nothrow
        {
            return charaDataList[curCharaIndex];
        }
    }
}

unittest
{
}
