@implementation PLCloudCommentsChangeNotification

+ (id)notificationWithAsset:(id)a3 snapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithObject:snapshot:changedObjects:", v7, v6, 0);

  return v8;
}

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("PLCloudCommentsDidChangeNotification");
  return CFSTR("PLCloudCommentsDidChangeNotification");
}

- (id)userInfo
{
  NSDictionary *userInfo;
  NSDictionary *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSDictionary *v14;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[PLContainerChangeNotification deletedIndexes](self, "deletedIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[PLContainerChangeNotification deletedIndexes](self, "deletedIndexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v7, CFSTR("DeletedItemsIndexesKey"));

    }
    -[PLContainerChangeNotification insertedIndexes](self, "insertedIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[PLContainerChangeNotification insertedIndexes](self, "insertedIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v10, CFSTR("AddedItemsIndexesKey"));

    }
    -[PLContainerChangeNotification changedIndexes](self, "changedIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      -[PLContainerChangeNotification changedIndexes](self, "changedIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v13, CFSTR("ChangedItemsIndexesKey"));

    }
    v14 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = objc_opt_class();
  -[PLCloudCommentsChangeNotification asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLContainerChangeNotification snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> asset: %p, snapshot: %p"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLContainerChangeNotification _diffDescription](self, "_diffDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v9);

  objc_autoreleasePoolPop(v3);
  return v8;
}

- (id)_contentRelationshipName
{
  return CFSTR("orderedCloudComments");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
