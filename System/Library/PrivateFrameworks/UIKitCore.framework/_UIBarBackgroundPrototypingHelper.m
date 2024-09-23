@implementation _UIBarBackgroundPrototypingHelper

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (**v8)(void);
  int v9;

  v5 = -[NSMutableArray count](self->_callbacks, "count", a3, a4);
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_callbacks, "objectAtIndexedSubscript:", v7);
      v8 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      v9 = v8[2]();

      if (v9)
      {
        ++v7;
      }
      else
      {
        -[NSMutableArray removeObjectAtIndex:](self->_callbacks, "removeObjectAtIndex:", v7);
        --v6;
      }
    }
    while (v7 < v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbacks, 0);
}

@end
