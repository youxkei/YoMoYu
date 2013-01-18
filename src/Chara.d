module Chara;

import dspecs;
import dgs.Sprite: Sprite;
import dgs.Input:  getKeyDir;
import dgs.util:   ctor;

import Data:       Data;

class Chara: Sprite
{
    invariant()
    {
        assert(data_);
    }

    public
    {
        mixin ctor;

        Data data;

        void move()
        {
            const dir = getKeyDir();
            final switch(dir)
            {
                case 1:
                case 7:
                    x -= data_.charaSkewSpeed;
                    break;
                case 3:
                case 9:
                    x += data_.charaSkewSpeed;
                    break;
                case 4:
                    x -= data_.charaSpeed;
                    break;
                case 6:
                    x += data_.charaSpeed;
                    break;
                case 2:
                case 5:
                case 8:
                    break;
            }
            final switch(dir)
            {
                case 7:
                case 9:
                    y -= data_.charaSkewSpeed;
                    break;
                case 1:
                case 3:
                    y += data_.charaSkewSpeed;
                    break;
                case 8:
                    y -= data_.charaSpeed;
                    break;
                case 2:
                    y += data_.charaSpeed;
                    break;
                case 4:
                case 5:
                case 6:
                    break;
            }
        }
    }

    private
    {
        alias data_ = data;
    }
}

