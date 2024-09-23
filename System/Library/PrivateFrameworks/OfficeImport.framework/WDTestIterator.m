@implementation WDTestIterator

- (WDTestIterator)initWithIterator:(id)a3
{
  id v5;
  WDTestIterator *v6;
  WDTestIterator *v7;
  id v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDTestIterator;
  v6 = -[WDTestIterator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mIterator, a3);
    v8 = -[WDTestIterator next](v7, "next");
  }

  return v7;
}

- (BOOL)test:(id)a3
{
  return 0;
}

- (BOOL)hasNext
{
  return self->mNext != 0;
}

- (id)next
{
  id v3;
  id mNext;
  void *v5;
  id v6;

  v3 = self->mNext;
  mNext = self->mNext;
  self->mNext = 0;

  while (-[WDIterator hasNext](self->mIterator, "hasNext"))
  {
    -[WDIterator next](self->mIterator, "next");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WDTestIterator test:](self, "test:", v5))
    {
      v6 = self->mNext;
      self->mNext = v5;

      return v3;
    }

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mNext, 0);
  objc_storeStrong((id *)&self->mIterator, 0);
}

@end
