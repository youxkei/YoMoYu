module Enemy;

import dgs.Sprite: Sprite;
import dgs.util: ctor;

import Data: Data;

class Enemy: Sprite
{
    invariant()
    {
        assert(data);
    }

    public
    {
        mixin ctor;

        Data data;
    }
}
