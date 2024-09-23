@implementation ECTwoObjectKeyCache

- (ECTwoObjectKeyCache)init
{
  ECTwoObjectKeyCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ECTwoObjectKeyCache;
  v2 = -[ECTwoObjectKeyCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mCache = v2->mCache;
    v2->mCache = v3;

  }
  return v2;
}

- (id)objectForKey1:(id)a3 key2:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->mCache, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setObject:(id)a3 forKey1:(id)a4 key2:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (v11 && v8)
  {
    -[NSMutableDictionary objectForKey:](self->mCache, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[ECPointerNilKeyDictionary dictionary](ECPointerNilKeyDictionary, "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->mCache, "setObject:forKey:");
    }
    objc_msgSend(v10, "setObject:forKey:", v11, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCache, 0);
}

@end
