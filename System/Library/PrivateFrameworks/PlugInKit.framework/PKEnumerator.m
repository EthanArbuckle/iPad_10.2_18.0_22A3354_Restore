@implementation PKEnumerator

+ (id)defaultFilter
{
  return &unk_1E5F40598;
}

- (PKEnumerator)init
{
  PKEnumerator *v2;
  PKEnumerator *v3;
  NSEnumerator *underlyingEnumerator;
  uint64_t v5;
  id filter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKEnumerator;
  v2 = -[PKEnumerator init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    underlyingEnumerator = v2->_underlyingEnumerator;
    v2->_underlyingEnumerator = 0;

    +[PKEnumerator defaultFilter](PKEnumerator, "defaultFilter");
    v5 = objc_claimAutoreleasedReturnValue();
    filter = v3->_filter;
    v3->_filter = (id)v5;

  }
  return v3;
}

- (PKEnumerator)initWithNSEnumerator:(id)a3
{
  id v5;
  PKEnumerator *v6;
  PKEnumerator *v7;
  uint64_t v8;
  id filter;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKEnumerator;
  v6 = -[PKEnumerator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingEnumerator, a3);
    +[PKEnumerator defaultFilter](PKEnumerator, "defaultFilter");
    v8 = objc_claimAutoreleasedReturnValue();
    filter = v7->_filter;
    v7->_filter = (id)v8;

  }
  return v7;
}

- (void)setFilter:(id)a3
{
  id v4;
  void *v5;
  id filter;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (!v4)
  {
    +[PKEnumerator defaultFilter](PKEnumerator, "defaultFilter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)MEMORY[0x1AF45AEB8](v4);
  filter = self->_filter;
  self->_filter = v5;

  v7 = v8;
  if (!v8)
  {

    v7 = 0;
  }

}

- (id)nextObject
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  int v7;
  id v8;

  v3 = 0;
  while (1)
  {
    v4 = v3;
    -[PKEnumerator underlyingEnumerator](self, "underlyingEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      break;
    -[PKEnumerator filter](self, "filter");
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v3);

    if (v7)
    {
      v8 = v3;
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (id)filter
{
  return self->_filter;
}

- (NSEnumerator)underlyingEnumerator
{
  return self->_underlyingEnumerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingEnumerator, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
