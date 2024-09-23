@implementation PLAssetContainerChangeNotification

- (void)dealloc
{
  NSDictionary *userInfo;
  objc_super v4;

  userInfo = self->_userInfo;
  self->_userInfo = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLAssetContainerChangeNotification;
  -[PLContainerChangeNotification dealloc](&v4, sel_dealloc);
}

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("PLAssetContainerDidChangeNotification");
  return CFSTR("PLAssetContainerDidChangeNotification");
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
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = objc_opt_class();
  -[PLAssetContainerChangeNotification container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  -[PLAssetContainerChangeNotification container](self, "container");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLContainerChangeNotification snapshot](self, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> container: <%@ %p>, snapshot: %p"), v5, self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLContainerChangeNotification _diffDescription](self, "_diffDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:", v11);

  if (self->_keyAssetDidChange)
    objc_msgSend(v10, "appendString:", CFSTR(", key asset changed"));
  if (self->_titleDidChange)
    objc_msgSend(v10, "appendString:", CFSTR(", title changed"));
  objc_autoreleasePoolPop(v3);
  return v10;
}

- (PLAlbumProtocol)album
{
  void *v3;
  void *v4;

  -[PLContainerChangeNotification object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE38B040))
  {
    -[PLContainerChangeNotification object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (PLAlbumProtocol *)v4;
}

- (BOOL)titleDidChange
{
  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  return self->_titleDidChange;
}

- (BOOL)keyAssetDidChange
{
  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  return self->_keyAssetDidChange;
}

- (PLAssetContainer)assetContainer
{
  void *v2;
  id v3;

  -[PLContainerChangeNotification _managedObject](self, "_managedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EE38A340))
    v3 = v2;
  else
    v3 = 0;

  return (PLAssetContainer *)v3;
}

- (id)_contentRelationshipName
{
  return CFSTR("assets");
}

- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4
{
  BOOL v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLAssetContainerChangeNotification;
  v7 = -[PLContainerChangeNotification _getOldSet:newSet:](&v12, sel__getOldSet_newSet_);
  -[PLContainerChangeNotification _managedObject](self, "_managedObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PLContainerChangeNotification _managedObject](self, "_managedObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fastPointerAccessSetForAssets:", *a3);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fastPointerAccessSetForAssets:", *a4);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_calculateDiffs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLAssetContainerChangeNotification;
  -[PLContainerChangeNotification _calculateDiffs](&v12, sel__calculateDiffs);
  -[PLContainerChangeNotification snapshot](self, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasSnapshotValueForProperty:", CFSTR("title")))
  {
    -[PLContainerChangeNotification snapshot](self, "snapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snapshotValueForProperty:", CFSTR("title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAssetContainerChangeNotification assetContainer](self, "assetContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v7)
    {
      self->_titleDidChange = 0;
    }
    else
    {
      -[PLContainerChangeNotification snapshot](self, "snapshot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "snapshotValueForProperty:", CFSTR("title"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAssetContainerChangeNotification assetContainer](self, "assetContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self->_titleDidChange = objc_msgSend(v9, "isEqual:", v11) ^ 1;

    }
  }
  else
  {
    self->_titleDidChange = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

+ (id)notificationWithContainer:(id)a3 snapshot:(id)a4 changedAssets:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithObject:snapshot:changedObjects:", v10, v9, v8);

  return v11;
}

@end
