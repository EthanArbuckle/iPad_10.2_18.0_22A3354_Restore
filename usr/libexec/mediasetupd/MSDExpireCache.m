@implementation MSDExpireCache

- (MSDExpireCache)initWithExpiration:(double)a3 countLimit:(unint64_t)a4
{
  MSDExpireCache *v6;
  uint64_t v7;
  MSDExpireCache *v8;
  uint64_t v9;
  NSCache *storage;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MSDExpireCache;
  v6 = -[MSDExpireCache init](&v12, "init");
  v8 = v6;
  if (v6)
  {
    v6->_expiration = a3;
    v9 = objc_opt_new(NSCache, v7);
    storage = v8->_storage;
    v8->_storage = (NSCache *)v9;

    -[NSCache setCountLimit:](v8->_storage, "setCountLimit:", a4);
  }
  return v8;
}

- (MSDExpireCache)initWithExpiration:(double)a3
{
  return -[MSDExpireCache initWithExpiration:countLimit:](self, "initWithExpiration:countLimit:", 10, a3);
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  double Current;
  double v7;
  double v8;
  double v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_storage, "objectForKey:", v4));
  if (v5)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v5, "creationTime");
    v8 = v7;
    -[MSDExpireCache expiration](self, "expiration");
    if (v8 + v9 >= Current)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
      goto LABEL_6;
    }
    -[NSCache removeObjectForKey:](self->_storage, "removeObjectForKey:", v4);
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _MSDExpireCacheEntry *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_MSDExpireCacheEntry initWithValue:]([_MSDExpireCacheEntry alloc], "initWithValue:", v7);

  -[NSCache setObject:forKey:](self->_storage, "setObject:forKey:", v8, v6);
}

- (void)removeObjectForKey:(id)a3
{
  -[NSCache removeObjectForKey:](self->_storage, "removeObjectForKey:", a3);
}

- (void)removeAllObjects
{
  -[NSCache removeAllObjects](self->_storage, "removeAllObjects");
}

- (unint64_t)count
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache allObjects](self->_storage, "allObjects"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (NSCache)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (double)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(double)a3
{
  self->_expiration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
