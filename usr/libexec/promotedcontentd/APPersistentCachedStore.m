@implementation APPersistentCachedStore

+ (id)createWithTotalCostLimit:(int64_t)a3
{
  return -[APCacheStore initWithTotalCostLimit:]([APCacheStore alloc], "initWithTotalCostLimit:", a3);
}

+ (id)createWithStorage:(id)a3
{
  id v3;
  APCacheStore *v4;
  id v5;
  APCacheStore *v6;

  v3 = a3;
  v4 = [APCacheStore alloc];
  v5 = objc_alloc_init((Class)NSCache);
  v6 = -[APCacheStore initWithFileStorage:memoryCache:](v4, "initWithFileStorage:memoryCache:", v3, v5);

  return v6;
}

- (BOOL)hasObjectForKey:(id)a3
{
  NSString *v3;
  void *v4;
  void *v5;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  APSimulateCrash(5, v5, 1);

  return 0;
}

- (id)objectForKey:(id)a3
{
  NSString *v3;
  void *v4;
  void *v5;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  APSimulateCrash(5, v5, 1);

  return 0;
}

- (void)removeObjectForKey:(id)a3
{
  NSString *v3;
  void *v4;
  id v5;

  v3 = NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5));
  APSimulateCrash(5, v4, 1);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSString *v4;
  void *v5;
  id v6;

  v4 = NSStringFromSelector(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  APSimulateCrash(5, v5, 1);

}

- (void)touchObjectForKey:(id)a3
{
  NSString *v3;
  void *v4;
  id v5;

  v3 = NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5));
  APSimulateCrash(5, v4, 1);

}

- (id)createTransaction
{
  NSString *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  APSimulateCrash(5, v5, 1);

  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v7));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (void)executeBlock:(id)a3
{
  NSString *v3;
  void *v4;
  id v5;

  v3 = NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5));
  APSimulateCrash(5, v4, 1);

}

- (void)removeObjectForKey:(id)a3 transaction:(id)a4
{
  NSString *v4;
  void *v5;
  id v6;

  v4 = NSStringFromSelector(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  APSimulateCrash(5, v5, 1);

}

- (void)setObject:(id)a3 forKey:(id)a4 transaction:(id)a5
{
  NSString *v5;
  void *v6;
  id v7;

  v5 = NSStringFromSelector(a2);
  v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v7));
  APSimulateCrash(5, v6, 1);

}

- (BOOL)isObjectAliveForKey:(id)a3
{
  NSString *v3;
  void *v4;
  void *v5;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  APSimulateCrash(5, v5, 1);

  return 0;
}

- (void)evictObjectFromMemoryCacheForKey:(id)a3
{
  NSString *v3;
  void *v4;
  id v5;

  v3 = NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5));
  APSimulateCrash(5, v4, 1);

}

- (id)objectForKey:(id)a3 ignoreKeys:(id)a4
{
  NSString *v4;
  void *v5;
  void *v6;

  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5));
  APSimulateCrash(5, v6, 1);

  return 0;
}

- (void)touchObjectForKey:(id)a3 transaction:(id)a4
{
  NSString *v4;
  void *v5;
  id v6;

  v4 = NSStringFromSelector(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  APSimulateCrash(5, v5, 1);

}

- (void)enableDiagnosticsWithInterval:(double)a3
{
  NSString *v3;
  void *v4;
  id v5;

  v3 = NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5));
  APSimulateCrash(5, v4, 1);

}

@end
