@implementation WDArrayIterator

- (WDArrayIterator)initWithArray:(id)a3
{
  id v5;
  WDArrayIterator *v6;
  WDArrayIterator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDArrayIterator;
  v6 = -[WDArrayIterator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mArray, a3);
    v7->mNextIndex = 0;
  }

  return v7;
}

- (BOOL)hasNext
{
  unint64_t mNextIndex;

  mNextIndex = self->mNextIndex;
  return -[NSArray count](self->mArray, "count") > mNextIndex;
}

- (id)next
{
  unint64_t mNextIndex;
  void *v4;

  mNextIndex = self->mNextIndex;
  if (-[NSArray count](self->mArray, "count") <= mNextIndex)
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->mArray, "objectAtIndex:", self->mNextIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ++self->mNextIndex;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mArray, 0);
}

@end
