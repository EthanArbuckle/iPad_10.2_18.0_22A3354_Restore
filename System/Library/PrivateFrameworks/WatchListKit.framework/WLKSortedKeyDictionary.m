@implementation WLKSortedKeyDictionary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDictionary, 0);
}

- (WLKSortedKeyDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  WLKSortedKeyDictionary *v8;
  uint64_t v9;
  NSDictionary *underlyingDictionary;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WLKSortedKeyDictionary;
  v8 = -[WLKSortedKeyDictionary init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", a3, a4, a5);
    underlyingDictionary = v8->_underlyingDictionary;
    v8->_underlyingDictionary = (NSDictionary *)v9;

  }
  return v8;
}

- (id)keyEnumerator
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[WLKSortedKeyDictionary count](self, "count"));
  -[WLKSortedKeyDictionary underlyingDictionary](self, "underlyingDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      objc_msgSend(v3, "addObject:", v7);
      objc_msgSend(v5, "nextObject");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    while (v8);
  }
  objc_msgSend(v3, "sortUsingSelector:", sel_compare_);
  objc_msgSend(v3, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WLKSortedKeyDictionary underlyingDictionary](self, "underlyingDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[WLKSortedKeyDictionary underlyingDictionary](self, "underlyingDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSDictionary)underlyingDictionary
{
  return self->_underlyingDictionary;
}

- (void)setUnderlyingDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
