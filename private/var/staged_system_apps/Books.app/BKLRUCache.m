@implementation BKLRUCache

- (BKLRUCache)initWithCapacity:(unint64_t)a3
{
  BKLRUCache *v4;
  uint64_t v5;
  NSMutableDictionary *cache;
  uint64_t v7;
  NSMutableArray *keys;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKLRUCache;
  v4 = -[BKLRUCache init](&v10, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cache = v4->_cache;
    v4->_cache = (NSMutableDictionary *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    keys = v4->_keys;
    v4->_keys = (NSMutableArray *)v7;

    v4->_capacity = a3;
  }
  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache cache](self, "cache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v19));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache keys](self, "keys"));
    objc_msgSend(v9, "removeObject:", v19);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache cache](self, "cache"));
  objc_msgSend(v10, "setObject:forKey:", v6, v19);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache keys](self, "keys"));
  objc_msgSend(v11, "insertObject:atIndex:", v19, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache keys](self, "keys"));
  v13 = objc_msgSend(v12, "count");
  v14 = -[BKLRUCache capacity](self, "capacity");

  if ((unint64_t)v13 > v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache keys](self, "keys"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache cache](self, "cache"));
    objc_msgSend(v17, "removeObjectForKey:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache keys](self, "keys"));
    objc_msgSend(v18, "removeLastObject");

  }
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache cache](self, "cache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache keys](self, "keys"));
    objc_msgSend(v7, "removeObject:", v4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache keys](self, "keys"));
    objc_msgSend(v8, "insertObject:atIndex:", v4, 0);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache cache](self, "cache"));
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("cache"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLRUCache keys](self, "keys"));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("keys"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[BKLRUCache capacity](self, "capacity"), CFSTR("capacity"));
}

- (BKLRUCache)initWithCoder:(id)a3
{
  id v4;
  BKLRUCache *v5;
  uint64_t v6;
  NSMutableDictionary *cache;
  uint64_t v8;
  NSMutableArray *keys;
  id v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKLRUCache;
  v5 = -[BKLRUCache init](&v13, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("cache")));
    cache = v5->_cache;
    v5->_cache = (NSMutableDictionary *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("keys")));
    keys = v5->_keys;
    v5->_keys = (NSMutableArray *)v8;

    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("capacity"));
    v11 = 2;
    if (v10)
      v11 = (uint64_t)v10;
    v5->_capacity = v11;
  }

  return v5;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSMutableArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keys, a3);
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
