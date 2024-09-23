@implementation NSMutableArray

- (void)shuffle
{
  id v3;
  unint64_t v4;
  uint32_t v5;
  uint64_t v6;
  unsigned int v7;

  v3 = -[NSMutableArray count](self, "count");
  v4 = (unint64_t)v3 - 2;
  if ((unint64_t)v3 >= 2)
  {
    v5 = v3;
    v6 = 0;
    v7 = 0;
    do
    {
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self, "exchangeObjectAtIndex:withObjectAtIndex:", v6, arc4random_uniform(v5--) + v7);
      v6 = ++v7;
    }
    while (v4 >= v7);
  }
}

- (void)shuffleWithSeed:(int)a3
{
  int v5;
  uint64_t v6;

  v5 = -[NSMutableArray count](self, "count");
  if (v5 >= 2)
  {
    srand(a3);
    v6 = (v5 - 1);
    do
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self, "exchangeObjectAtIndex:withObjectAtIndex:", v6--, rand() % v5--);
    while ((_DWORD)v6);
  }
}

- (id)dequeue
{
  void *v3;

  if (-[NSMutableArray count](self, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self, "objectAtIndex:", 0));
    if (v3)
      -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", 0);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
