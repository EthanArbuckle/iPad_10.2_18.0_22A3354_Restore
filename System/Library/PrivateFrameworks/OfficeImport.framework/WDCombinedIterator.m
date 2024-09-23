@implementation WDCombinedIterator

- (WDCombinedIterator)initWithParentIterator:(id)a3
{
  id v5;
  WDCombinedIterator *v6;
  WDCombinedIterator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDCombinedIterator;
  v6 = -[WDCombinedIterator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mParentIterator, a3);
    -[WDCombinedIterator incrementChildIterator](v7, "incrementChildIterator");
  }

  return v7;
}

- (id)childIteratorFrom:(id)a3
{
  return 0;
}

- (id)newChildIteratorFrom:(id)a3
{
  return 0;
}

- (BOOL)hasNext
{
  return self->mChildIterator != 0;
}

- (id)next
{
  WDIterator *mChildIterator;
  void *v4;

  mChildIterator = self->mChildIterator;
  if (mChildIterator)
  {
    -[WDIterator next](mChildIterator, "next");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[WDIterator hasNext](self->mChildIterator, "hasNext"))
      -[WDCombinedIterator incrementChildIterator](self, "incrementChildIterator");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (WDIterator)childIterator
{
  return self->mChildIterator;
}

- (void)setChildIterator:(id)a3
{
  objc_storeStrong((id *)&self->mChildIterator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChildIterator, 0);
  objc_storeStrong((id *)&self->mParentIterator, 0);
}

- (void)incrementChildIterator
{
  void *v3;
  id v4;
  WDIterator *mChildIterator;

  do
  {
    -[WDIterator next](self->mParentIterator, "next");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = -[WDCombinedIterator newChildIteratorFrom:](self, "newChildIteratorFrom:", v3);
      -[WDCombinedIterator setChildIterator:](self, "setChildIterator:", v4);

    }
    else
    {
      -[WDCombinedIterator setChildIterator:](self, "setChildIterator:", 0);
    }

    mChildIterator = self->mChildIterator;
  }
  while (mChildIterator && !-[WDIterator hasNext](mChildIterator, "hasNext"));
}

@end
