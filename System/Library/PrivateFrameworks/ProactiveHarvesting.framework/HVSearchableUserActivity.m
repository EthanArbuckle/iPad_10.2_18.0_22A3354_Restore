@implementation HVSearchableUserActivity

- (HVSearchableUserActivity)initWithUserActivity:(id)a3 searchableItem:(id)a4
{
  id v7;
  id v8;
  HVSearchableUserActivity *v9;
  HVSearchableUserActivity *v10;
  uint64_t v11;
  NSString *persistentIdentifierOrFallback;
  NSString *v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSString *v17;
  objc_super v19;
  uint64_t __buf;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HVSearchableUserActivity;
  v9 = -[HVSearchableUserActivity init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userActivity, a3);
    objc_storeStrong((id *)&v10->_searchableItem, a4);
    objc_msgSend(v7, "persistentIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    persistentIdentifierOrFallback = v10->_persistentIdentifierOrFallback;
    v10->_persistentIdentifierOrFallback = (NSString *)v11;

    v13 = v10->_persistentIdentifierOrFallback;
    if (v13)
    {
      v14 = v13;
    }
    else
    {
      v21 = 0;
      __buf = 0;
      arc4random_buf(&__buf, 9uLL);
      v15 = (void *)MEMORY[0x22074FDF0]();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &__buf, 9);
      objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v15);
    }
    v17 = v10->_persistentIdentifierOrFallback;
    v10->_persistentIdentifierOrFallback = v14;

  }
  return v10;
}

- (double)absoluteTimestamp
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CSSearchableItem attributeSet](self->_searchableItem, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentCreationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return v5;
}

- (NSString)domainId
{
  return (NSString *)CFSTR("__ProactiveHarvesting__.HVSearchableUserActivity");
}

- (NSString)uniqueId
{
  return (NSString *)+[HVSearchableUserActivity uniqueIdForPersistentIdentifier:](HVSearchableUserActivity, "uniqueIdForPersistentIdentifier:", self->_persistentIdentifierOrFallback);
}

- (NSString)bundleId
{
  return (NSString *)-[CSSearchableItem bundleID](self->_searchableItem, "bundleID");
}

- (unint64_t)hash
{
  return -[NSString hash](self->_persistentIdentifierOrFallback, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HVSearchableUserActivity *v4;
  HVSearchableUserActivity *v5;
  NSUserActivity *userActivity;
  void *v7;
  CSSearchableItem *searchableItem;
  void *v9;
  char v10;

  v4 = (HVSearchableUserActivity *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      userActivity = self->_userActivity;
      -[HVSearchableUserActivity userActivity](v5, "userActivity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSUserActivity isEqual:](userActivity, "isEqual:", v7)
        && -[NSString isEqual:](self->_persistentIdentifierOrFallback, "isEqual:", v5->_persistentIdentifierOrFallback))
      {
        searchableItem = self->_searchableItem;
        -[HVSearchableUserActivity searchableItem](v5, "searchableItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[CSSearchableItem isEqual:](searchableItem, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (CSSearchableItem)searchableItem
{
  return self->_searchableItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableItem, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_persistentIdentifierOrFallback, 0);
}

+ (id)uniqueIdForPersistentIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(CFSTR("__ProactiveHarvesting__persistentIdentifier:"), "stringByAppendingString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);

  return v5;
}

@end
