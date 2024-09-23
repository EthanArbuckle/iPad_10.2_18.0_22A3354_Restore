@implementation UIKBTreeLocalizedKeylistEnumerator

- (id)nextObject
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[NSEnumerator nextObject](self->_nameEnum, "nextObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    while (1)
    {
      if (!+[UIKBTree shouldSkipCacheString:](UIKBTree, "shouldSkipCacheString:", v4))
      {
        -[NSDictionary objectForKey:](self->_keyplaneCache, "objectForKey:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizationKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          break;
      }
      -[NSEnumerator nextObject](self->_nameEnum, "nextObject");
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
      if (!v8)
        goto LABEL_6;
    }
    -[NSDictionary objectForKey:](self->_keyplaneCache, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_6:
    v9 = 0;
  }
  return v9;
}

- (UIKBTreeLocalizedKeylistEnumerator)initWithKeyplaneCache:(id)a3
{
  id v5;
  UIKBTreeLocalizedKeylistEnumerator *v6;
  UIKBTreeLocalizedKeylistEnumerator *v7;
  uint64_t v8;
  NSEnumerator *nameEnum;
  UIKBTreeLocalizedKeylistEnumerator *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIKBTreeLocalizedKeylistEnumerator;
  v6 = -[UIKBTreeLocalizedKeylistEnumerator init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keyplaneCache, a3);
    -[NSDictionary keyEnumerator](v7->_keyplaneCache, "keyEnumerator");
    v8 = objc_claimAutoreleasedReturnValue();
    nameEnum = v7->_nameEnum;
    v7->_nameEnum = (NSEnumerator *)v8;

    v10 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameEnum, 0);
  objc_storeStrong((id *)&self->_keyplaneCache, 0);
}

@end
