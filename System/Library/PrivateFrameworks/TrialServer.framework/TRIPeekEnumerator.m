@implementation TRIPeekEnumerator

- (TRIPeekEnumerator)initWithEnumerator:(id)a3
{
  id v5;
  TRIPeekEnumerator *v6;
  TRIPeekEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIPeekEnumerator;
  v6 = -[TRIPeekEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingEnum, a3);

  return v7;
}

- (id)peekNextObject
{
  id peek;
  void *v4;
  id v5;

  peek = self->_peek;
  if (!peek)
  {
    -[NSEnumerator nextObject](self->_underlyingEnum, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_peek;
    self->_peek = v4;

    peek = self->_peek;
  }
  return peek;
}

- (id)nextObject
{
  id peek;
  id v4;
  id v5;

  peek = self->_peek;
  if (peek)
  {
    v4 = peek;
    v5 = self->_peek;
    self->_peek = 0;

  }
  else
  {
    -[NSEnumerator nextObject](self->_underlyingEnum, "nextObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_peek, 0);
  objc_storeStrong((id *)&self->_underlyingEnum, 0);
}

@end
