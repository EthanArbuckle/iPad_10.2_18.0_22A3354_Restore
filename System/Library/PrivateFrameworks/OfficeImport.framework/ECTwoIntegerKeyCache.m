@implementation ECTwoIntegerKeyCache

- (ECTwoIntegerKeyCache)init
{
  ECTwoIntegerKeyCache *v2;
  OITSUIntegerKeyDictionary *v3;
  OITSUIntegerKeyDictionary *mCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ECTwoIntegerKeyCache;
  v2 = -[ECTwoIntegerKeyCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OITSUIntegerKeyDictionary);
    mCache = v2->mCache;
    v2->mCache = v3;

    v2->_assertForCollisions = 1;
  }
  return v2;
}

- (id)objectForKey1:(int64_t)a3 key2:(int64_t)a4
{
  void *v5;
  void *v6;

  -[OITSUIntegerKeyDictionary objectForKey:](self->mCache, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKey1:(int64_t)a4 key2:(int64_t)a5
{
  OITSUIntegerKeyDictionary *v8;
  id v9;

  v9 = a3;
  -[OITSUIntegerKeyDictionary objectForKey:](self->mCache, "objectForKey:", a4);
  v8 = (OITSUIntegerKeyDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(OITSUIntegerKeyDictionary);
    -[OITSUIntegerKeyDictionary setObject:forKey:](self->mCache, "setObject:forKey:");
  }
  -[OITSUIntegerKeyDictionary setObject:forKey:](v8, "setObject:forKey:", v9, a5);

}

- (BOOL)assertForCollisions
{
  return self->_assertForCollisions;
}

- (void)setAssertForCollisions:(BOOL)a3
{
  self->_assertForCollisions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCache, 0);
}

@end
