import dspecs;

mixin template singleton()
{
    static typeof(this) opCall(Args...)(Args args)
    {
        static typeof(this) instance;
        if(!instance) instance = new typeof(this)(args);
        return instance;
    }
}

version(unittest)
{
    int i;
    class Hoge
    {
        this()
        {
            ++i;
        }

        mixin singleton;
    }
}

unittest
{
    "Hoge".は /
    {
        "最初に作られた時にiをインクリメントする".べき /
        {
            auto h = Hoge();
            assert(i == 1);
        };

        "次に作られたときはiをインクリメントしない".べき /
        {
            auto h = Hoge();
            assert(i == 1);
        };
    };
}
